
PImage img;
float value;
float minValue = 15;
float maxValue = 50;
void setup() {
  size(990, 1177);
  img = loadImage("image.jpg"); // 导入图片
}

void draw() {
  background(0);
  value = map(mouseX, 0, width, minValue, maxValue);
  int blockSize = int(value); // 每个像素块的大小

  loadPixels();
  for (int x = 0; x < width; x += blockSize) {
    for (int y = 0; y < height; y += blockSize) {
      int c = img.get(x, y); // 获取当前像素的颜色
      float brightness = map(brightness(c), 0, 255, 1, blockSize/2); // 根据像素亮度映射线条长度
      float angle = map(brightness(c), 0, 255, 0, PI); // 根据像素亮度映射线条角度

      float lineX1 = x - brightness/2  *cos(angle); // 线条起点 x 坐标
      float lineY1 = y - brightness/2  *sin(angle); // 线条起点 y 坐标
      float lineX2 = x + brightness/2  *cos(angle); // 线条终点 x 坐标
      float lineY2 = y + brightness/2  *sin(angle); // 线条终点 y 坐标

      stroke(c); // 设置线条颜色
      line(lineX1, lineY1, lineX2, lineY2); // 绘制线条

    }
  }
  saveFrame();//
}
