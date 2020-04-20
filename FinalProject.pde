//Kat Sotelo & Gharin Pautz & Vincent Rettke
//Final Project
//04/21/2020


//Table
Table table2019;

//Variables
int numCols;
int numRows;
int counter;
int country = 15;

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
float[] regions2019;

void setup(){
  size (1000,800);
  background(255);
  drawOutline();
  initializeVaribles();
  loadTables();
}

void draw(){
  background(255);
  drawOutline();
  
// UNCOMMENT YOUR FUNCTION TO CREATE YOUR IMPLEMENTATION 
  //drawScatterPlot();
  //drawBarChart();
  drawTrendChart();
}

// Initializes all variables used in the implementation
void initializeVaribles(){
  table2019 = loadTable("2019.csv","header");
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
  regions2019 = new float[30]; 
}


//Loads information from 2019 table
void loadTables(){
  int i = 0;
  for (int row = 0; row < 30; row++) {
    countries2019[i] = table2019.getString(row,"Country or region");
    score2019[i] = table2019.getFloat(row, "Score");
    gdp2019[i] = table2019.getFloat(row, "GDP per capita");
    socialSupport2019[i] = table2019.getFloat(row, "Social support");
    healthyLife2019[i] = table2019.getFloat(row, "Healthy life expectancy");
    freedom2019[i] = table2019.getFloat(row, "Freedom to make life choices");
    generosity2019[i] = table2019.getFloat(row, "Generosity");
    corruption2019[i] = table2019.getFloat(row, "Perceptions of corruption");
    regions2019[i] = table2019.getFloat(row, "Region");
    score2015[i] = table2019.getFloat(row, "Score2015");
    score2016[i] = table2019.getFloat(row, "Score2016");
    score2017[i] = table2019.getFloat(row, "Score2017");
    score2018[i] = table2019.getFloat(row, "Score2018");
    i++;
  }

}

//draws the rectangles and sets the titles
void drawOutline(){
  writeText();
  drawRects();
}

void writeText(){
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
  
  text("Bar Graph ", width/2 -300, 425);
  text("Trends of Happiness for ", width/2 + 150, 425);
}

void drawRects(){
  //shape part
  noFill();
  strokeWeight(2);
  
  rect(20,40,width - 150,height/2 - 50); //scatter rect
  rect(width-120, 40, 100 ,height/2 - 50); //button rect
  
  //little rect buttons
  rect(width - 112, 50, 85, 30);
  rect(width - 112, 90, 85, 30);
  rect(width - 112, 130, 85, 30);
  rect(width - 112, 170, 85, 30);
  rect(width - 112, 210, 85, 30);
  rect(width - 112, 250, 85, 30);
  rect(width - 112, 290, 85, 30);
  
  rect(20,430,width/2 -30,height/2 - 50); //left bottom rect
  rect(width/2 ,430,width/2 -20,height/2 - 50); //right bottom rect
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
void drawScatterPlot() {
  //graph starts at (20,40)
  //      ends at (width - 150, height/2 - 50
  
  float min = findMin(score2019);
  float max = findMax(score2019);
  println("MIN: " + min);
  println("Max: " + max);
}

// Draws line graph with 2019 happiness score on y-axis
// and the last 5 recorded years of the selected country 
// on the x-axis.
void drawTrendChart() {
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
