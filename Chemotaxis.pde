// small fish array holder
Fish[] fishie = new Fish[41];
// giant fish array holder
Fish[] giant = new Fish[11];
// food size
int s = 100;
// switch to allow giant fish to appear
boolean j = false;
// switch to eat small fish/food
boolean t = false;
// food dropping y coordinate
int counter = 0;
 void setup()   
 { 
   size(1000, 600);
   background(127, 205, 255);
   frameRate(60);
   // small fish 
   for (int i = 0; i < fishie.length; i++){
     fishie[i] = new Fish(35, 200, 400);
   }
   // big fish
   for (int i = 0; i < giant.length; i++){
     giant[i] = new Fish(120, 100, 500);
   }
 }   
 void draw()   
 {  
   // b ocean background
   background(127, 205, 255);
   // small fish 
   for (int i = 0; i < fishie.length; i++){
     fishie[i].show();
     fishie[i].move();
     fishie[i].touch();
   }
   // food
   fill(100);
   ellipse(800, counter, s, s);
   counter += 2;
   // if ellipse's y > 300, stay still
   if (counter > 300){
     counter = 300;
   }
   // allows small fish to eat food and big fish to spawn 
   if (j == true){
     // Oh no text
     fill(0);
     textSize(32);
     textAlign(CENTER);
     text("Oh No!", 500, 100);
     // makes food ball smaller as fish are eating it
     if (frameCount % 5 == 0){
       s -= 1;
     }
     // giant fish appear and eat little fish
     for (int i = 0; i < giant.length; i++){
       giant[i].show();
       giant[i].move();
       if (dist(giant[i].x, giant[i].y, fishie[i].x, fishie[i].y) < 30){
           t = true;
       }
       
     }
   }
   
 }  
 class Fish  
 {     
   int r;
   int b;
   int g;
   int x;
   int y;
   int fishsize;
   Fish(int fishs, int fishymin, int fishymax){
     // random color
     r = (int)(Math.random()*155) + 100;
     b = (int)(Math.random()*155) + 100;
     g = (int)(Math.random()*155) + 100;
     // random x and y coordinates for fish
     x = (int)(Math.random()*200) + 100;
     y = (int)(Math.random()*(fishymax-fishymin)) + fishymin;
     // fish size
     fishsize = fishs;
   }
   
   void show(){
     // draws fish
     fill(r, g, b);
     noStroke();
     ellipse(x, y, fishsize, fishsize/3.5);
     triangle(x-fishsize/1.4,y+fishsize/7,x-fishsize/1.4,y-fishsize/7,x-fishsize/5,y);
     fill(0);
     ellipse(x - fishsize/6, y - fishsize/6, fishsize / 7, fishsize / 7);
   }
   
   void move(){
     // random walk 
     x += (int)(Math.random()*10) - 1;
     if (y > 300){
       y += (int)(Math.random()*6) - 3;
     }
     else if (y < 300){
      y += (int)(Math.random()*6) - 2;
     }
     else{
      y += (int)(Math.random()*7) - 3;
     }
     // if fish go off screen, respawn
     if (x > 1200){
       x = (int)(Math.random()*200) + 100;
       y = (int)(Math.random()*400) + 100;
     }

   }
   void touch() {
     // if small fish touches food, the fish stop and start eating
     if (dist(x, y, 800, counter) < 40){
      x = 750;
      x += (int)(Math.random()*3) - 1;
      y += (int)(Math.random()*21) - 10;
       j = true;
     }
     // if big fish touches small fish, small fish disappear
     if (t == true){
       fishsize = 0;
       s = 0;
     }
   
   }
   
 } 
