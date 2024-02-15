float siz = 10;
float maxSize = 480;
float step = 2;
boolean growing = true;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  drawFractal(width / 2, height / 2, siz);
  
  if (growing) {
    siz += step;
    if (siz >= maxSize) {
      growing = false;
    }
  } else {
    siz -= step;
    if (siz <= 10) {
      growing = true;
    }
  }
}

void drawFractal(float x, float y, float size) {
  float height = size * (sqrt(3) / 2);
  float x1 = x - size / 2;
  float y1 = y + height / 3;
  float x2 = x + size / 2;
  float y2 = y + height / 3;
  float x3 = x;
  float y3 = y - (2 * height) / 3;
  
  triangle(x1, y1, x2, y2, x3, y3);
  
  if (size > 10) {
    drawFractal(x - size / 4, y + height / 6, size / 2);
    drawFractal(x + size / 4, y + height / 6, size / 2);
    drawFractal(x, y - height / 3, size / 2);
  }
}
