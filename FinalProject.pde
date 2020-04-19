//Kat Sotelo & Gharin Pautz & Vincent Rettke
//Final Project
//04/21/2020


//Table
Table table2019;

//Variables
int numCols;
int numRows;
int counter;

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
    println(countries2019[i] + "\t" + score2017[i]);
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
