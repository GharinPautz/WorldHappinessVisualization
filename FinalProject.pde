//Kat Sotelo & Gharin Pautz & Vincent Rettke
//Final Project
//05/07/2020


//Table
Table table2019;

//Variables
int numCols;
int numRows;
int counter;
int country = 15;
int selectedCountry;

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

void setup() {
  size (1000, 800);
  background(255);
  drawOutline();
  initializeVaribles();
  loadTables();
  chosenArray = gdp2019;
  selectedCountry = 0;
}

void draw() {
  background(255);
  drawOutline();

  // UNCOMMENT YOUR FUNCTION TO CREATE YOUR IMPLEMENTATION 
  drawScatterPlot(chosenArray, selectedCountry);
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
  writeText();
  drawRects();
}

void writeText() {
  //text part
  textSize(15);
  fill(50);
  text("Happiness Chart for 2019", width/2 - 100, 20);
  text("Score", width -100, 70); 
  text("GDP ", width -100, 110); 
  text("Social Supp", width -110, 150); 
  text("Healthy Life", width -110, 190); 
  text("Freedom to", width -110, 230); 
  text("Generosity", width -110, 270); 
  text("Percp of Cor", width -110, 310);

  text("Click Buttons", width -119, 340);
  text("to change x ", width -118, 360);
  text("axis.", width -90, 380);

  text("Happiness Scores ", width/2 -300, 425);
  text("Trends of Happiness for ", width/2 + 150, 425);
}

void drawRects() {
  //shape part
  noFill();
  strokeWeight(2);

  rect(20, 40, width - 150, height/2 - 50); //scatter rect
  rect(width-120, 40, 100, height/2 - 50); //button rect

  //little rect buttons
  rect(width - 112, 50, 85, 30);
  rect(width - 112, 90, 85, 30);
  rect(width - 112, 130, 85, 30);
  rect(width - 112, 170, 85, 30);
  rect(width - 112, 210, 85, 30);
  rect(width - 112, 250, 85, 30);
  rect(width - 112, 290, 85, 30);

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
void drawScatterPlot(float[] xArray, int selectedCountry) {
  //graph starts at (20,40)
  //      ends at (width - 150, height/2 - 50

  float yMin = findMin(score2019);
  float yMax = findMax(score2019);
  float xMin = findMin(xArray);
  float xMax = findMax(xArray);

  float radX = 15;
  float radY = 15;

  float x, y;

  for (int i = 0; i < 30; i++) {
    if (i == selectedCountry) {
      stroke(25);
      strokeWeight(5);
      fill(#D61C98);
    } else if (regions2019[i] == 1) {
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
    } 
    y = map(score2019[i], yMin, yMax, 40, height/2 - 50);
    x = map(xArray[i], xMin, xMax, 30, width - 140);

    ellipse(x, (height/2) - y, radX, radY);
  }
  strokeWeight(1);
  stroke(#000000);



}

// Uses button clicks to change the array for X-axis on scatter plot
void mouseClicked() {
  if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 50 && mouseY < 80)
    chosenArray = score2019;
  else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 90 && mouseY < 120)
    chosenArray = gdp2019;
  else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 130 && mouseY < 160)
    chosenArray = socialSupport2019;
  else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 170 && mouseY < 200)
    chosenArray = healthyLife2019;
  else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 210 && mouseY < 240)
    chosenArray = freedom2019;
  else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 250 && mouseY < 280)
    chosenArray = generosity2019;
  else if (mouseX > (width - 112) && mouseX < (width - 112 + 85) && mouseY > 290 && mouseY < 320)
    chosenArray = corruption2019;
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
  float minScore = findMin(score2019);
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

  // re-map scores so that minimum is lowest score and maximum is highest
  float point1 = map(score2015[country], minScore, maxScore, bottom, graphHeight);
  float point2 = map(score2016[country], minScore, maxScore, bottom, graphHeight);
  float point3 = map(score2017[country], minScore, maxScore, bottom, graphHeight);
  float point4 = map(score2018[country], minScore, maxScore, bottom, graphHeight);
  float point5 = map(score2019[country], minScore, maxScore, bottom, graphHeight);

  // Draw trend line for past 5 years
  line(tick1, point1, tick2, point2);
  line(tick2, point2, tick3, point3);
  line(tick3, point3, tick4, point4);
  line(tick4, point4, tick5, point5);

  // label ticks
  text("2015", tick1 - 20, bottom + 25);
  text("2016", tick2 - 20, bottom + 25);
  text("2017", tick3 - 20, bottom + 25);
  text("2018", tick4 - 20, bottom + 25);
  text("2019", tick5 - 20, bottom + 25);
}

//Draws the bar chart with the 2019 happiness scores
void drawBarChart() {
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
  float yMax = 0.75 * yLen;
  float yMin = 0.25 * yLen;

  line(lineX, heightFromBottom, xAxisB, heightFromBottom); //xaxis
  line(lineX, heightFromBottom, lineX, lineY); //yaxis

  //Writes Happiness Score
  pushMatrix();
  fill(0);
  translate(50, 680);
  rotate(-HALF_PI);
  text("Happiness Scores", 0, 0);
  popMatrix();

  for (int i = 0; i < 30; i++) {
    if (i == selectedCountry) {
      stroke(25);
      strokeWeight(5);
      fill(#D61C98);
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

//Changes through the 30 different countries that are selected
void keyPressed() {
  if (key == CODED && keyCode == UP) {
    selectedCountry = (selectedCountry + 1) % 30;
  } else if (key == CODED && keyCode == DOWN) {
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
  curCountry = "Current Country: "+countries2019[selectedCountry];
  text(curCountry, xCord + 5, 15);
  text("Score: " + score2019[selectedCountry], 200, 750);
  text("Current Country: "+countries2019[selectedCountry], 150, 770);
  noFill();
}
