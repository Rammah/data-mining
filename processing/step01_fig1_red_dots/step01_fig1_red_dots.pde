
Table data;
float value;
float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;
float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

int rowCount;
int columnCount;
int barWidth=2;


PFont plotFont;


void setup() {
  size(600, 600);
  // Corners of the plotted time series
  plotX1 = 50; 
  plotX2 = width - 50;
  plotY1 = 50;
  plotY2 = height - 50;
  labelY = height - 50;

  data = new Table("iris.txt");
  print(data.getFloat(1,1)+"\n");
  rowCount = data.getRowCount();
  MinMax(1);
  // The row count will be used a lot, store it locally.
  
}

void draw() {
  background(255);// it was 255

  smooth();
  noStroke();
  drawDataBars(1);
}




void drawDataBars(int col) {
  
  stroke(color(255,0,0));
  strokeWeight(10);
  rectMode(CORNERS);
  fill(green(255));
  
  for (int row = 0; row < rowCount; row++) {
    
      float value = data.getFloat(row, col);
      float x = map(row, 0, 150, plotX1, plotX2);
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      
      rect(x-barWidth/2, y, x+barWidth/2, plotY2);
      //print(x+" "+y+"\n");
  }
}


void MinMax(int col){
  for (int row = 0; row < rowCount; row++) {
    value = data.getFloat(row, col);
    if (value > dataMax) {
      dataMax = value;
    }
    if (value < dataMin) {
      dataMin = value;
    }
   print(dataMin+" "+dataMax+" "+ value+"\n"); 
  }
  
}
