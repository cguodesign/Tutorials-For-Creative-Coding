boolean brushed = false;
float brushCenter = 30;
float brushRadius = 20;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  stroke(255);
  strokeWeight(2);
  fill(0);
  ellipse(brushCenter, brushCenter, brushRadius, brushRadius);
}

void mouseClicked() {
  if (brushed == false) {
    float distMouseToCenter = dist(mouseX, mouseY, brushCenter, brushCenter);
    println(distMouseToCenter);
    if (distMouseToCenter <= brushRadius) {
      brushed = true;
      println("Brush loaded!");
    }
  }
  else {
    float distMouseToCenter2 = dist(mouseX, mouseY, brushCenter, brushCenter);
    println(distMouseToCenter2);
    if (distMouseToCenter2 <= brushRadius) {
      brushed = false;
      println("Brush canceled!");
    }
    else {
      stroke(255);
      strokeWeight(2);
      fill(0);
      ellipse(mouseX, mouseY, brushRadius, brushRadius);
    }
  }
}
