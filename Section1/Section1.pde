int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  static final float WIDTH = 400;
  static final float HEIGHT = 200;
  final color TOP_COLOR = color(0, 255, 0);
  final color MID_COLOR = color(255, 255, 0);
  final color BOT_COLOR = color(255, 0, 0);
  final int numBars = 20;
  float x, y;
  float barWidth;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[numBars];
    speeds = new float[numBars];
    for (int i = 0; i < numBars; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, WIDTH, HEIGHT);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border
    
    // width of each bar
    barWidth = WIDTH / numBars; 
    
    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    for (int i = 0; i < numBars; i++) {
      float val = values[i];
      if (val < 0) {
        fill(lerpColor(MID_COLOR, BOT_COLOR, val / MIN_VALUE));
      } else {
        fill(lerpColor(MID_COLOR, TOP_COLOR, val / MAX_VALUE));
      }
      rect(x + i * barWidth, y + 100 - val, barWidth, val);
    }


    //Width of the visualizer is 400!
    
  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      float cur = values[i];
      if (cur > MAX_VALUE) {
        values[i] = MAX_VALUE;
        speeds[i] *= -1;
      }
      if (cur < MIN_VALUE) {
        values[i] = MIN_VALUE;
        speeds[i] *= -1;
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(50, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}