PFont font1, font2;
float x, y, z;
float a=0;
float b=0;
String txt="Hello SJTU";
String message ="你好，上交大";
Letter[]letters;

void setup() {
  size(600, 600);
  font1 = loadFont("Ebrima-Bold-48.vlw");
  font2 = createFont("微软雅黑", 48);
//  frameRate(60);

  textFont(font1);
  textFont(font2);
  letters = new Letter[message.length()];
  float w = 280;
  for (int i= 0; i< message.length (); i++ ) {
  letters[i] = new Letter(w, 270, message.charAt(i)); 
  w+= textWidth(message.charAt(i));

  }

}

void draw() {
  thebackground();
  noise();
//英文动
  float tHeight=0;
  for(int q=0;q<txt.length();q++){
  float tH=random(10,30);
  textSize(32+tH);
  fill(random(255),random(255),random(255));
  char c=txt.charAt(q);
  float tW=textWidth(c);
  text(c,300+tHeight,200);
  tHeight+=tW;
}
//中文
  for (int i= 0; i< letters.length; i ++ ) {
   letters[i].display();
   letters[i].home();
    
  }
     
}


void thebackground() {
  colorMode(HSB, 360, 255, 100);
  x=random(360);
  y=random(255);
  z=random(50, 100);
  fill(x, y, z);
  rect(0, 0, 800, 800);
}

void noise() {

  for (int j=0; j<width; j++) {
    stroke(0);
    strokeWeight(3);
    line(j, 500, j, 2.5*height*noise(b*a+0.1));
    b+=0.0009;
  }//横排
  for (int p=0;p<width;p++) {
    stroke(#FCB10D, 60);
    strokeWeight(3);
    line(0, 0,p*0.5, 0.3* height*noise(a));
    line(0, 600,p*0.5, 0.3* height*noise(a));
    a+=0.015;
  }//竖排
}
