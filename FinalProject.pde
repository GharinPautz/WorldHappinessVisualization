//Kat Sotelo & Gharin Pautz & Vincent Rettke
//CPSC313 Final Project
//05/07/2020

// This project uses a dataset from https://www.kaggle.com/unsdsn/world-happiness
// and visualizes 3 graphs depicting world hapiness scores, and number of different
// attributes included in the dataset.


//Table
Table table2019;

//Variables
int numCols;
int numRows;
int counter;
int selectedCountry;
int buttonColorChanger = 0;

String curCountry;

//Arrays
String[] countries2019;
float[] score2019;
float[] score2015;
float[] score2016;
float[] score2017;
float[] score2018;
float[] gdp2019;
float[] socialSupport2019;
float[] healthyLife2019;
float[] freedom2019;
float[] generosity2019;
float[] corruption2019;
float[] chosenArray;
int[] regions2019;
int[] overallRank;

//motion
float size = 8;
float minSize = 8;
float maxSize = 15;
//Animation speed of increase/decrease
float sizeSpeed = 0.3;

void setup() {
  size (1000, 800);
  background(255);

  initializeVaribles();
  loadTables();
  drawOutline();
  chosenArray = score2019;
  selectedCountry = 0;
}

void draw() {
  background(255);
  drawOutline();

  // Animation of ellipses increasing and decreasing length. Used this link as a reference.
  // https://stackoverflow.com/questions/35156661/how-to-make-the-size-of-ellipse-to-get-smaller-and-bigger-in-processing-automati
  if (size < minSize || size > maxSize) {
    sizeSpeed *= -1;
  }
  size += sizeSpeed;


  drawScatterPlot(chosenArray, selectedCountry, size, size);
  drawBarChart();
  drawTrendChart();
  showCurCountry(selectedCountry);
}

// Initializes all variables used in the implementation
void initializeVaribles() {
  table2019 = loadTable("2019.csv", "header");
  numCols = table2019.getColumnCount();
  numRows = table2019.getRowCount(); 
  countries2019 = new String[30];
  score2019 = new float[30];
  score2015 = new float[30];
  score2016 = new float[30];
  score2017 = new float[30];
  score2018 = new float[30];
  gdp2019 = new float[30];
  socialSupport2019 = new float[30];
  healthyLife2019 = new float[30];
  freedom2019 = new float[30];
  generosity2019 = new float[30];
  corruption2019 = new float[30];
  regions2019 = new int[30]; 
  overallRank = new int[30];
}


//Loads information from 2019 table
void loadTables() {
  int i = 0;
  for (int row = 0; row < 30; row++) {
    overallRank[i] = table2019.getInt(row, "Overall rank");
    countries2019[i] = table2019.getString(row, "Country or region");
    score2019[i] = table2019.getFloat(row, "Score");
    gdp2019[i] = table2019.getFloat(row, "GDP per capita");
    socialSupport2019[i] = table2019.getFloat(row, "Social support");
    healthyLife2019[i] = table2019.getFloat(row, "Healthy life expectancy");
    freedom2019[i] = table2019.getFloat(row, "Freedom to make life choices");
    generosity2019[i] = table2019.getFloat(row, "Generosity");
    corruption2019[i] = table2019.getFloat(row, "Perceptions of corruption");
    regions2019[i] = table2019.getInt(row, "Region");
    score2015[i] = table2019.getFloat(row, "Score2015");
    score2016[i] = table2019.getFloat(row, "Score2016");
    score2017[i] = table2019.getFloat(row, "Score2017");
    score2018[i] = table2019.getFloat(row, "Score2018");
    i++;
  }
}

//draws the rectangles and sets the titles
void drawOutline() {
  drawRects();
  writeText();
}

void writeText() {
  //text part
  textSize(12);
  fill(50);
  text("Use right & left arrow keys to switch countries", 15, 15);
  text("Happiness", width - 100, 70); 
  text("GDP", width - 85, 110); 
  text("Social Support", width - 110, 150); 
  text("Healthy Life", width -105, 190); 
  text("Freedom", width - 95, 230); 
  text("Generosity", width - 100, 270); 
  text("Corruption", width - 100, 310);

  textSize(15);
  text("Click Buttons", width -118, 340);
  text("to change x ", width -113, 360);
  text("axis.", width -85, 380);

  text("2019 Happiness Scores vs. Selected Factor", width/2 - 160, 30);
  text("2019 Happiness Scores for Top 30 Countries", width/2 -400, 425);
  text("Happiness Scores from 2015-2019 of ", width/2 + 39, 425);
  fill(255, 0, 0);
  text(countries2019[selectedCountry], width/2 + 320, 425);
}

void drawRects() {
  //shape part
  noFill();
  strokeWeight(2);

  rect(20, 40, width - 150, height/2 - 50); //scatter rect
  rect(width-120, 40, 100, height/2 - 50); //button rect

  //little rect buttons
  if (buttonColorChanger == 0)
    fill(#EBFF7E);
  rect(width - 112, 50, 85, 30);
  noFill();
  if (buttonColorChanger == 1)
    fill(#EBFF7E);
  rect(width - 112, 90, 85, 30);
  noFill();
  if (buttonColorChanger == 2)
    fill(#EBFF7E);
  rect(width - 112, 130, 85, 30);
  noFill();
  if (buttonColorChanger == 3)
    fill(#EBFF7E);
  rect(width - 112, 170, 85, 30);
  noFill();
  if (buttonColorChanger == 4)
    fill(#EBFF7E);
  rect(width - 112, 210, 85, 30);
  noFill();
  if (buttonColorChanger == 5)
    fill(#EBFF7E);
  rect(width - 112, 250, 85, 30);
  noFill();
  if (buttonColorChanger == 6)
    fill(#EBFF7E);
  rect(width - 112, 290, 85, 30);
  noFill();

  rect(20, 430, width/2 -30, height/2 - 50); //left bottom rect
  rect(width/2, 430, width/2 -20, height/2 - 50); //right bottom rect
}

// Returns the smallest float value within array
float findMin(float[] array) {
  int i = 0;
  float temp = array[i];
  for (i = 1; i < 30; i++) {
    if (array[i] < temp)
      temp = array[i];
  }
  return temp;
}

// Returns the greatest float value within array
float findMax(float[] array) {
  int i = 0;
  float temp = array[i];
  for (i = 1; i < 30; i++) {
    if (array[i] > temp)
      temp = array[i];
  }
  return temp;
}

// Draws scatter plot with 2019 happiness score on y-axis
// and the reader's choice of variable on the x-axis.
void drawScatterPlot(float[] xArray, int selectedCountry, float animWidth, float animHeight) {
  // Rectangle starts at (20,40)
  //      ends at (width - 150, height/2 - 50

  // draw color key for scatterplot
  drawColorKey();

  // draw outlines for scatterplot graph
  // Scatterplot starts at (200, 60)
  //       ends at (width - 150, height/2 - 50)
  float xAxisYStart = (height / 2) - 50; //350
  float xAxisYEnd = 60;
  float xAxisXStart = 200;

  float yAxisXEnd = width - 150;
  float yAxisYHeight = (height / 2) - 50;

  // Y-Axis Label
  pushMatrix();
  fill(0);
  translate(xAxisXStart - 30, xAxisYStart - 85);
  rotate(-HALF_PI);
  text("Happiness Scores", 0, 0);
  popMatrix();

  strokeWeight(1);
  textSize(10);
  line(xAxisXStart, xAxisYStart, xAxisXStart, xAxisYEnd); //y-axis
  // draw tick marks on y-axis
  line(xAxisXStart - 5, xAxisYStart, xAxisXStart + 5, xAxisYStart);
  text("6.34", xAxisXStart - 30, xAxisYStart);
  line(xAxisXStart - 5, xAxisYStart - 145 / 2, xAxisXStart + 5, xAxisYStart - 145 / 2);
  text("6.70", xAxisXStart - 30, xAxisYStart - 145 / 2);
  line(xAxisXStart - 5, xAxisYEnd + ((xAxisYStart - xAxisYEnd) / 2), xAxisXStart + 5, xAxisYEnd + ((xAxisYStart - xAxisYEnd) / 2));
  text("7.05", xAxisXStart - 25, xAxisYEnd + ((xAxisYStart - xAxisYEnd) / 2));
  line(xAxisXStart - 5, xAxisYEnd + 145 / 2, xAxisXStart + 5, xAxisYEnd + 145 / 2);
  text("7.41", xAxisXStart - 30, xAxisYEnd + 145 / 2);
  line(xAxisXStart - 5, xAxisYEnd, xAxisXStart + 5, xAxisYEnd);
  text("7.77", xAxisXStart - 30, xAxisYEnd);

  // X-Axis Label

  strokeWeight(5);
  if (chosenArray == score2019) {
    fill(0);
    textSize(15);
    text("Happiness Scores", 430, height/2 - 20);
    textSize(10);
    text("6.34", xAxisXStart - 10, xAxisYStart + 15);
    text("6.70", xAxisXStart + 152.5, xAxisYStart + 15);
    text("7.05", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("7.41", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("7.77", yAxisXEnd - 10, xAxisYStart + 15);
  } else if (chosenArray == gdp2019) {
    fill(0);
    textSize(15);
    text("GDP Per Capita", 440, height/2 - 20);
    textSize(10);
    text("0.8", xAxisXStart - 10, xAxisYStart + 15);
    text("1.02", xAxisXStart + 152.5, xAxisYStart + 15);
    text("1.24", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("1.46", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("1.68", yAxisXEnd - 10, xAxisYStart + 15);
  } else if (chosenArray == socialSupport2019) {
    fill(0);
    textSize(15);
    text("Social Support", 450, height/2 - 20);
    textSize(10);
    text("1.27", xAxisXStart - 10, xAxisYStart + 15);
    text("1.36", xAxisXStart + 152.5, xAxisYStart + 15);
    text("1.46", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("1.54", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("1.62", yAxisXEnd - 10, xAxisYStart + 15);
  } else if (chosenArray == healthyLife2019) {
    fill(0);
    textSize(15);
    text("Healthy Life Expectancy", 420, height/2 - 20);
    textSize(10);
    text("0.75", xAxisXStart - 10, xAxisYStart + 15);
    text("0.83", xAxisXStart + 152.5, xAxisYStart + 15);
    text("0.91", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("0.99", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("1.06", yAxisXEnd - 10, xAxisYStart + 15);
  } else if (chosenArray == freedom2019) {
    fill(0);
    textSize(15);
    text("Freedom To Make Life Choices", 400, height/2 - 20);
    textSize(10);
    text("0.35", xAxisXStart - 10, xAxisYStart + 15);
    text("0.41", xAxisXStart + 152.5, xAxisYStart + 15);
    text("0.47", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("0.54", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("0.60", yAxisXEnd - 10, xAxisYStart + 15);
  } else if (chosenArray == generosity2019) {
    fill(0);
    textSize(15);
    text("Generosity", 460, height/2 - 20);
    textSize(10);
    text("0.04", xAxisXStart - 10, xAxisYStart + 15);
    text("0.13", xAxisXStart + 152.5, xAxisYStart + 15);
    text("0.21", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("0.29", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("0.37", yAxisXEnd - 10, xAxisYStart + 15);
  } else if (chosenArray == corruption2019) {
    fill(0);
    textSize(15);
    text("Perceptions of Corruption", 420, height/2 - 20);
    textSize(10);
    text("0.03", xAxisXStart - 10, xAxisYStart + 15);
    text("0.13", xAxisXStart + 152.5, xAxisYStart + 15);
    text("0.22", (width + 50) / 2 - 10, xAxisYStart + 15);
    text("0.32", yAxisXEnd - 172.5, xAxisYStart + 15);
    text("0.41", yAxisXEnd - 10, xAxisYStart + 15);
  }

  strokeWeight(1);
  line(xAxisXStart, yAxisYHeight, yAxisXEnd, yAxisYHeight); //x-axis
  // tick marks on x-axis
  line(xAxisXStart, yAxisYHeight + 5, xAxisXStart, yAxisYHeight - 5);
  line(xAxisXStart + 162.5, yAxisYHeight + 5, xAxisXStart + 162.5, yAxisYHeight - 5);
  line((width + 50) / 2, yAxisYHeight + 5, (width + 50) / 2, yAxisYHeight - 5);
  line(yAxisXEnd - 162.5, yAxisYHeight + 5, yAxisXEnd - 162.5, yAxisYHeight - 5);
  line(yAxisXEnd, yAxisYHeight + 5, yAxisXEnd, yAxisYHeight - 5);

  // Retrieve data and draw circles
  float yMin = findMin(score2019);
  float yMax = findMax(score2019);
  float xMin = findMin(xArray);
  float xMax = findMax(xArray);

  float radX = 15;
  float radY = 15;

  float x, y;

  for (int i = 0; i < 30; i++) {
     if (regions2019[i] == 1) {
      fill(#0035FF);
      stroke(#0035FF);
    } else if (regions2019[i] == 2) {
      fill(#FA0D3C);
      stroke(#FA0D3C);
    } else if (regions2019[i] == 3) {
      fill(#11F068);
      stroke(#11F068);
    } else if (regions2019[i] == 4) {
      fill(#E7F011);
      stroke(#E7F011);
    } else if (regions2019[i] == 5) {
      fill(#E0A205);
      stroke(#E0A205);
    } else if (regions2019[i] == 6) {
      fill(#A337C4);
      stroke(#A337C4);
    } else if (regions2019[i] == 7) {
      fill(#F56FCD);
      stroke(#F56FCD);
    } if (i == selectedCountry) {
      stroke(25);
      strokeWeight(5);
    }
    
    y = map(score2019[i], yMin, yMax, 70, height/2 - 60);
    x = map(xArray[i], xMin, xMax, 210, width - 160);

    if (i != selectedCountry) {
      ellipse(x, (height/2) - y, radX, radY);
    }
    //If the selected country is chosen then there is motion
    if (i == selectedCountry) {
      ellipse(x, (height/2) - y, animWidth, animHeight);
    } 
    
  }

  strokeWeight(1);
  stroke(#000000);
}

// Draws the color key in scatterplot based on the regions each country is in
void drawColorKey() {
  // Rectangle starts at (20,40)
  //      ends at (width - 150, height/2 - 50

  textSize(12);

  // Blue = West Europe
  fill(#0035FF);
  rect(30, 100, 25, 25);
  fill(0);
  text("West Europe", 60, 120);

  // North America
  fill(#FA0D3C);
  rect(30, 130, 25, 25);
  fill(0);
  text("North America", 60, 150);

  // Oceania
  fill(#11F068);
  rect(30, 160, 25, 25);
  fill(0);
  text("Oceania", 60, 180);

  // Middle East & North Africa
  fill(#E7F011);
  rect(30, 190, 25, 25);
  fill(0);
  text("Middle East &", 60, 202);
  text("North Africa", 60, 212);

  // Latin America anad Caribbean
  fill(#E0A205);
  rect(30, 220, 25, 25);
  fill(0);
  text("Latin America &", 60, 232);
  text("Caribbean", 60, 242);

  // Southeast Asia
  fill(#A337C4);
  rect(30, 250, 25, 25);
  fill(0);
  text("Southeast Asia", 60, 270);

  // Central & East Europe
  fill(#F56FCD);
  rect(30, 280, 25, 25);
  fill(0);
  text("Central &", 60, 292);
  text("East Europe", 60, 302);

  textSize(15);
}

// Uses button clicks to change the array for X-axis on scatter plot
void mouseClicked() {
  if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 50 && mouseY < 80)
  {
    chosenArray = score2019;
    buttonColorChanger = 0;
  } else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 90 && mouseY < 120)
  {
    chosenArray = gdp2019;
    buttonColorChanger = 1;
  } else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 130 && mouseY < 160)
  {
    chosenArray = socialSupport2019;
    buttonColorChanger = 2;
  } else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 170 && mouseY < 200)
  {
    chosenArray = healthyLife2019;
    buttonColorChanger = 3;
  } else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 210 && mouseY < 240)
  {
    chosenArray = freedom2019;
    buttonColorChanger = 4;
  } else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 250 && mouseY < 280)
  {
    chosenArray = generosity2019;
    buttonColorChanger = 5;
  } else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 290 && mouseY < 320)
  {
    chosenArray = corruption2019;
    buttonColorChanger = 6;
  }
}

// Draws line graph with 2019 happiness score on y-axis
// and the last 5 recorded years of the selected country 
// on the x-axis.
void drawTrendChart() {
  fill(0);
  strokeWeight(1);
  float leftBorder = width/2 + 75;
  float rightBorder = width - 75;
  float bottom = height - 75;
  float graphHeight = 480;
  float graphWidth = (rightBorder - leftBorder) - 50;  // subtracted 20 to keep last values on graph
  float minScore = findMin(score2015);
  float maxScore = findMax(score2019);
  float tick1 = leftBorder + graphWidth/5;
  float tick2 = leftBorder + 2*(graphWidth/5);
  float tick3 = leftBorder + 3*(graphWidth/5);
  float tick4 = leftBorder + 4*(graphWidth/5);
  float tick5 = leftBorder + 5*(graphWidth/5);

  line(leftBorder, graphHeight, leftBorder, bottom);  // draw x-axis
  line(leftBorder, bottom, rightBorder, bottom);  // draw y-axis

  // draw x-axis tick marks
  line(tick1, bottom + 5, leftBorder + graphWidth/5, bottom - 5);
  line(tick2, bottom + 5, leftBorder + 2*(graphWidth/5), bottom - 5);
  line(tick3, bottom + 5, leftBorder + 3*(graphWidth/5), bottom - 5);
  line(tick4, bottom + 5, leftBorder + 4*(graphWidth/5), bottom - 5);
  line(tick5, bottom + 5, leftBorder + 5*(graphWidth/5), bottom - 5);

  // draw y-axis tick marks
  line(leftBorder - 5, bottom, leftBorder + 5, bottom);
  line(leftBorder - 5, bottom - graphHeight/8, leftBorder + 5, bottom - graphHeight/8);
  line(leftBorder - 5, bottom - 2*graphHeight/8, leftBorder + 5, bottom - 2*graphHeight/8);
  line(leftBorder - 5, bottom - 3*graphHeight/8, leftBorder + 5, bottom - 3*graphHeight/8);
  line(leftBorder - 5, bottom - 4*graphHeight/8, leftBorder + 5, bottom - 4*graphHeight/8);

  float scoreRange = findMax(score2019) - findMin(score2015); 
  float minimum = findMin(score2015);

  // label y-axis tick marks
  textSize(10);
  text(minimum, leftBorder - 40, bottom);
  text(scoreRange/4 + minimum, leftBorder - 40, bottom - graphHeight/8 + 5);
  text(scoreRange/2 + minimum, leftBorder - 40, bottom - 2*graphHeight/8 + 5);
  text(3*scoreRange/4 + minimum, leftBorder - 40, bottom - 3*graphHeight/8 + 5);
  text(findMax(score2019), leftBorder - 40, bottom - 4*graphHeight/8 + 5);

  // re-map scores so that minimum is lowest score and maximum is highest
  float point1 = map(score2015[selectedCountry], minScore, maxScore, bottom, graphHeight);
  float point2 = map(score2016[selectedCountry], minScore, maxScore, bottom, graphHeight);
  float point3 = map(score2017[selectedCountry], minScore, maxScore, bottom, graphHeight);
  float point4 = map(score2018[selectedCountry], minScore, maxScore, bottom, graphHeight);
  float point5 = map(score2019[selectedCountry], minScore, maxScore, bottom, graphHeight);

  // Draw trend line for past 5 years
  line(tick1, point1, tick2, point2);
  line(tick2, point2, tick3, point3);
  line(tick3, point3, tick4, point4);
  line(tick4, point4, tick5, point5);

  // Draw points of each year
  ellipse(tick1, point1, 5, 5);
  ellipse(tick2, point2, 5, 5);
  ellipse(tick3, point3, 5, 5);
  ellipse(tick4, point4, 5, 5);
  ellipse(tick5, point5, 5, 5);

  // label x-axis ticks
  textSize(15);
  text("2015", tick1 - 20, bottom + 25);
  text("2016", tick2 - 20, bottom + 25);
  text("2017", tick3 - 20, bottom + 25);
  text("2018", tick4 - 20, bottom + 25);
  text("2019", tick5 - 20, bottom + 25);

  // Writes Happiness Score
  pushMatrix();
  fill(0);
  translate(width/2 + 20, 680);
  rotate(-HALF_PI);
  textSize(15);
  text("Happiness Scores", 0, 0);
  popMatrix();
}

//Draws the bar chart with the 2019 happiness scores
void drawBarChart() {
  drawTicksForBarChart();
  float minScore = findMin(score2019);
  float maxScore = findMax(score2019);
  float lineX = 75;
  float heightFromBottom = height - 75;
  float xAxisB = (width/2) - 75;
  float lineY = 480;

  float newWidth = (xAxisB - lineX) / 30;
  float newHeight; 
  float inc = 75;

  //for scaling the graph
  float yLen = heightFromBottom - lineY;
  float yMax = 0.87 * yLen;
  float yMin = 0.55 * yLen;

  line(lineX, heightFromBottom, xAxisB, heightFromBottom); //xaxis
  line(lineX, heightFromBottom, lineX, lineY); //yaxis

  //Writes Happiness Score
  pushMatrix();
  fill(0);
  translate(50, 680);
  rotate(-HALF_PI);
  text("Happiness Scores", 0, 0);
  popMatrix();

//changes the color of fill when it is chosen
  for (int i = 0; i < 30; i++) {
    if (i == selectedCountry) {
      stroke(25);
      strokeWeight(3);
      if (regions2019[i] == 1) {
        fill(#0035FF);
      } else if (regions2019[i] == 2) {
        fill(#FA0D3C);
      } else if (regions2019[i] == 3) {
        fill(#11F068);
      } else if (regions2019[i] == 4) {
        fill(#E7F011);
      } else if (regions2019[i] == 5) {
        fill(#E0A205);
      } else if (regions2019[i] == 6) {
        fill(#A337C4);
      } else if (regions2019[i] == 7) {
        fill(#F56FCD);
      }
    } else {
      noStroke();
      strokeWeight(1);
      stroke(#000000);
      fill(255);
    }

    newHeight = map (score2019[i], minScore, maxScore, yMin, yMax);
    rect(inc, heightFromBottom, newWidth, -newHeight);
    inc = inc + newWidth;
  }
}

void drawTicksForBarChart() {
  fill(0);

  float textX = 58;
  float lineX1 = 65;
  float lineX2 = 75;
  float lineY = (height - 120);

  //draws ticks
  line(lineX1, lineY, lineX2, lineY); // 2
  line(lineX1, lineY - 70, lineX2, lineY-70); // 5
  line(lineX1, lineY-135, lineX2, lineY-135); // 7
  line(lineX1, lineY-200, lineX2, lineY-200); // 10
  //writes numbers
  text("0", textX, (height - 70));
  text("2", textX, (height - 120));
  text("5", textX, (height - 190));
  text("7", textX, (height - 255));
  text("10", textX, (height - 320));
  noFill();
}

//Changes through the 30 different countries that are selected
void keyPressed() {
  if (key == CODED && keyCode ==RIGHT) {
    selectedCountry = (selectedCountry + 1) % 30;
  } else if (key == CODED && keyCode == LEFT) {
    selectedCountry = (selectedCountry - 1) % 30;

    if (selectedCountry < 0) {
      selectedCountry = 29;
    } else if (selectedCountry >29) {
      selectedCountry =0;
    }
  }
} 

// Shows text at the top of visualization with country name 
void showCurCountry(int selectedCountry) {
  textSize(15);
  float xCord = (width/2) + 200;
  fill(50);
  curCountry = "Current Country: "+ countries2019[selectedCountry];
  text("Current Country: ", xCord + 5, 15);
  fill(255, 0, 0);
  text(countries2019[selectedCountry], xCord + 132, 15);
  fill(0);
  text("Score: " + score2019[selectedCountry], 200, 750);
  text("Current Country: ", 150, 770);
  fill(255, 0, 0);
  text(countries2019[selectedCountry], 277, 770);
  noFill();
}
