eyeBallClass eyeLeft; //构建具体的左右眼睛
eyeBallClass eyeRight;
int counterClick = 0;
boolean isEyeDropped;
float dropSpeed = 2;
int dropTime;

void setup(){
  size(400,400);
  background(0);

  eyeLeft = new eyeBallClass(100,107); //左眼属于一个class，调用class的创建方法
  eyeRight = new eyeBallClass(300,107); //eyeBallClass(float positionX, float positionY){
}

void draw(){
    
    background(0); //
    stroke(255);
    strokeWeight(5);
    line(50,100,150,100);
    line(250,100,350,100);

      //eyeLeft.drawEye(); //调用眼睛的绘图方法，绘制眼睛
      //eyeRight.drawEye();
    if ( isEyeDropped == false){
    eyeLeft.moveEye(mouseX); //调用眼睛移动的方法，给它mouseX的值
    eyeRight.moveEye(mouseX);
    }else{
      eyeLeft.dropEye();
      eyeRight.dropEye();
    }
}

void mouseClicked(){
  if ( counterClick % 2 == 0) {
    isEyeDropped = false;
  }else{
    isEyeDropped = true;
    dropTime = 0;
  }
  counterClick = counterClick+1;
}

class eyeBallClass{
  float buildEyePositionX; // 设定class内部使用的参数
  float buildEyePositionY;
  float dropEyeY;

  eyeBallClass(float positionX, float positionY){
    buildEyePositionX = positionX; //把构造的参数值赋给class内部使用的参数
    buildEyePositionY = positionY;
  }

  void drawEye(){
    fill(255);
    ellipse(buildEyePositionX, buildEyePositionY, 7, 7);
  }

  void moveEye(float moveXPixel){   // 创建眼镜的移动
    float moveXPixelNew = map(moveXPixel,0,400,-50,50);   //把参数值转换 
    ellipse(buildEyePositionX + moveXPixelNew, buildEyePositionY, 7, 7); //画一个新的眼睛
    println(moveXPixel);
  }

  void dropEye(){
    ellipse(buildEyePositionX + map(mouseX,0,400,-50,50), buildEyePositionY + (dropSpeed * dropTime), 7, 7);
    dropTime = dropTime + 1;  
 }
  
}
