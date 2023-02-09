float baseH = 20;
float armL1 = 50;
float armL2 = 60;
float armL3 = 60;
float angle0 = 180;
float angle1 = 0;
float angle2 = 180;
float angle3 = 0;
float l3 = 0;
float l4 = 0;
float dif = 1.0;


void setup(){
  size(1000, 800, P3D);
  //background(255);
  
  camera(100, 100, 100, 0, 0, 0, 0, 0, -1);
  
  noStroke();  
}

void draw(){
  
  background(255);
 //ここからしばらく動作確認用  
  if(keyPressed){
    if(key == 'x'){
      angle0 = angle0 + dif;
    }
    if(key == 'X'){
      angle0 = angle0 - dif;
    }
    if(key == 'd'){
      angle1 = angle1 + dif;
    }
    if(key == 'D'){
      angle1 = angle1 - dif;
    }
    if(key == 'f'){
      angle1 = angle1 + dif;
      angle2 = angle2 - 2 * dif; 
    }
    if(key == 'F'){
      angle1 = angle1 - dif;
      angle2 = angle2 + 2 * dif;
    }
    if(key == 'e'){
      angle2 = angle2 - dif;
    }
    if(key == 'E'){
      angle2 = angle2 + dif;
    }
    if(key == 'z'){
      l3 = l3 + dif;
    }
    if(key == 'Z'){
      l3 = l3 - dif;
    }
    if(key == 'y'){
      l4 = l4 + dif;
    }
    if(key == 'Y'){
      l4 = l4 - dif;
    }
    if(key == '0'){
     angle0 = 180;
     angle1 = 0;
     angle2 = 180;
     angle3 = 0; 
     l3 = 0;
     l4 = 0;
     dif = 1;
    }
 //動作確認終了
    
      //運搬ロボットの棚への移動
    if(key == 'b'){
      dif = 1;
   if((angle0 < 270)){
     angle0 = angle0 + dif;
        }
     else if((angle1 < 10)){   
      angle1 = angle1 + dif;
      angle2 = angle2 - 2*dif;
     }
     else if((l3 < 20)){
        l3 = l3 + dif; 
        } 
     else{ 
        dif = 0; 
     }
    }
    
 //テーブル右奥の人への提供
   if(key == 'r'){
     dif = 1;
   if((angle0 < 185)){
     angle0 = angle0 + dif;
        }
     else if((angle1 < 90)){   
      angle1 = angle1 + dif;
      angle2 = angle2 - 2*dif;
     }
     else if((l3 < 30)){
        l3 = l3 + dif; 
        } 
     else{ 
        dif = 0; 
     } 
   }
    
    
    //テーブル右手前の人への提供
   if(key == 'R'){
     dif = 1;
   if((angle0 < 190)){
     angle0 = angle0 + dif;
        }
     else if((angle1 < 40)){   
      angle1 = angle1 + dif;
      angle2 = angle2 - 2*dif;
     }
     else if((l3 < 30)){
        l3 = l3 + dif; 
        } 
     else{ 
        dif = 0; 
     }
   }
   
    //テーブル左奥の人への提供
   if(key == 'l'){
     dif = 1;
   if((angle0 > 175)){
     angle0 = angle0 - dif;
        }
     else if((angle1 < 90)){   
      angle1 = angle1 + dif;
      angle2 = angle2 - 2*dif;
     }
     else if((l3 < 30)){
        l3 = l3 + dif; 
        } 
     else{ 
        dif = 0; 
     } 
   }
   
 //テーブル左手前の人への提供
   if(key == 'L'){
     dif = 1;
   if((angle0 > 170)){
     angle0 = angle0 - dif;
        }
     else if((angle1 < 40)){   
      angle1 = angle1 + dif;
      angle2 = angle2 - 2*dif;
     }
     else if((l3 < 30)){
        l3 = l3 + dif; 
        } 
     else{ 
        dif = 0; 
     }
   }
   
 //基準姿勢に戻す
   if(key == 's'){
     dif = 1;
   if((l3 > 0)){
     l3 = l3 - dif;
        }
     else if((angle1 > 0)){   
      angle1 = angle1 - dif;
      angle2 = angle2 + 2*dif;
     }
     else if((angle0 >180)){
       angle0 = angle0 - dif;
     }
     else if(angle0 < 180){
       angle0 = angle0 + dif;
        } 
     else{ 
        dif = 0; 
     }
   }   
   
   
 }  

  
  //base
  pushMatrix();
  rotateZ(radians(angle0));
  translate(0,0,-40);
  fill(175);
  box(10,10,baseH);
  
  //1st link
  translate(0,10,baseH/2);
  rotateY(radians(angle1));
  translate(0,0,armL1/2);
  fill(150);
  box(10,10,armL1);
  
  //2nd link
  //go to 2nd joint
  translate(0,10,armL1/2);
  rotateY(radians(angle2));  
  translate(0,0,armL2/2);
  fill(125);
  box(10,10,armL2);
  
  //3rd link
  translate(0, 10, armL2/2);
  rotateY(radians(180-angle1-angle2));   
  fill(100);
   translate(0,0,l3-20);
  box(10,10,armL3);
  
 //4th link
  translate(0, l4, armL3/2);
  fill(30);
  box(10,10,5);
  
  popMatrix();
  translate(-102, -30, -80);
  fill(139, 69, 19);
  box(120, 75, 4);
  
}
