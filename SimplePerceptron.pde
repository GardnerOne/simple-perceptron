Perceptron brain;
Point[] points;

void setup() {
  size(800, 800);
  
  float[] inputs = {-1, 0.5};
  
  brain = new Perceptron();
  points = new Point[100];
  
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point(); 
  }
  
  int guess = brain.guess(inputs);
  println(guess);
}

void draw() {
  background(255);
  
  stroke(0);
  line(0,0, width, height);
  
  for (Point pt : points) {
     pt.show();
     float[] inputs = {pt.x, pt.y};
     int target = pt.label;
     
     int guess = brain.guess(inputs);
     if (guess == target) {
       fill(0, 255, 0);
     }
     else {
       fill(255, 0, 0); 
     }
     noStroke();
     ellipse(pt.x, pt.y, 8, 8);
  }
}

void mousePressed() {
  for (Point pt : points) {
     pt.show();
     float[] inputs = {pt.x, pt.y};
     int target = pt.label;
     brain.train(inputs, target);
  }
}
