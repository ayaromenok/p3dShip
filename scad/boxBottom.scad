include <../../lib/lib.scad>
//1g ~ 300.6602344mm
//v1 - 110g, 32857mm, 5.85h
//v2 - 100.5g, 30161mm, 5.7h

// 110g, 32841mm, 5.5h
//boxBottomCyl(200); 

//156g, 47809mm, 8.70h
//boxBottomCyl_4(100,200,topSupportRound=true);
//boxBottomCyl_4(100,200,100,topSupportRound=true);
//boxBottomCyl_4(100,200,100,100,topSupportRound=true);
//boxBottomCyl_4(100,200,0,100,topSupportRound=true);


//152g, 46074mm, 8.350h
//boxBottomCyl_4(100,200,topSupportRound=false);
//boxBottomCyl_4(100,200,100,topSupportRound=false);
//boxBottomCyl_4(100,200,100,100,topSupportRound=false);
//boxBottomCyl_4(100,200,0,100,topSupportRound=false);

//99g,  29985mm, 5.95h
//boxBottomCyl_4(200,200,topSupportRound=true); 

//87g, 26143, 5.5h
//boxBottomCyl_4(200,200, topSupportRound=false);

boxBottomCyl_1(50,50,topSupportRound=true);
//boxBottomCyl_4(50,50,topSupportRound=true);



module boxBottomCyl_1 (size=200, height=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0, topSupportRound=false){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        size_2 = size/2;
        size_4 = size/4;
        sizeDiag_2=size_2*sin(45)*2;
        height_2= height/2;
        LRadius=6;
        LDiameter=LRadius*2;
        
        longHeight=3;
        longShift=3;
        p10=[[0,3],[7,0],[0,-3]];
        pSide=[[0,0],[7,0],[0,-3]];
        
        difference(){
            union(){
                yCube(size,size,0.7,0,0,-height_2);                               
                //bottom sides
                yPoly(pSide, szz=size, px=size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=0);
                yPoly(pSide, szz=size, px=-size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=90);
                yPoly(pSide, szz=size, px=-size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=180);
                yPoly(pSide, szz=size, px=size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=270);   
            
                //bottom diagonal longerons    
                yPoly(p10, szz=size*sin(45)*2, px=size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=45);
                yPoly(p10, szz=size*sin(45)*2, px=size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=-45);
            
                //vertical langerons
                yCyl(LRadius,height,0,0,0);                                
                
                
                //top diagonal longerons
                if (topSupportRound) {
                    supportRound(sizeDiag_2,longHeight,longShift,    size_4,size_4,height_2-sizeDiag_2/2,   45,90,0);
                    supportRound(sizeDiag_2,longHeight,longShift,    size_4,-size_4,height_2-sizeDiag_2/2,   135,90,0);
                    supportRound(sizeDiag_2,longHeight,longShift,    -size_4,-size_4,height_2-sizeDiag_2/2,   225,90,0);
                    supportRound(sizeDiag_2,longHeight,longShift,    -size_4,size_4,height_2-sizeDiag_2/2,   315,90,0);
                    } else {
                    yPoly(p10, szz=size*sin(45)*2, px=-size_2,py=-size_2,pz=height_2,      rx=0,ry=90, rz=45);
                    yPoly(p10, szz=size*sin(45)*2, px=-size_2,py=size_2,pz=height_2,      rx=0,ry=90, rz=-45);
                }//topSupportRound
                //square connectors on the top
                yCube(LDiameter,LDiameter,longShift,    size_2,size_2,height_2-longShift/2);
                yCube(LDiameter,LDiameter,longShift,    size_2,-size_2,height_2-longShift/2);
                yCube(LDiameter,LDiameter,longShift,    -size_2,size_2,height_2-longShift/2);
                yCube(LDiameter,LDiameter,longShift,    -size_2,-size_2,height_2-longShift/2);
            }//union
            
            //holes on top
            yCyl(LRadius/2,LRadius,0,0,height_2);
            
            //side cuts
            yCube(LDiameter,size+LDiameter,height+1,size_2+LRadius);
            yCube(LDiameter,size+LDiameter,height+1,-size_2-LRadius);
            yCube(size+LDiameter,LDiameter,height+1,0,size_2+LRadius);
            yCube(size+LDiameter,LDiameter,height+1,0,-size_2-LRadius);
            
        }//diff
        
    }//transform
}//module  


module boxBottomCyl_4 (size=200, height=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0, topSupportRound=false){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        size_2 = size/2;
        size_4 = size/4;
        sizeDiag_2=size_2*sin(45)*2;
        height_2= height/2;
        LRadius=6;
        LDiameter=LRadius*2;
        
        p10=[[0,3],[7,0],[0,-3]];
        pSide=[[0,0],[7,0],[0,-3]];
        
        difference(){
            union(){
                yCube(size,size,0.7,0,0,-height_2);                               
                //bottom sides
                yPoly(pSide, szz=size, px=size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=0);
                yPoly(pSide, szz=size, px=-size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=90);
                yPoly(pSide, szz=size, px=-size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=180);
                yPoly(pSide, szz=size, px=size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=270);   
            
                //bottom diagonal longerons    
                yPoly(p10, szz=size*sin(45)*2, px=size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=45);
                yPoly(p10, szz=size*sin(45)*2, px=size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=-45);
            
                //vertical langerons
                yCyl(LRadius,height,size_2,size_2,0);                                
                yCyl(LRadius,height,size_2,-size_2,0);
                yCyl(LRadius,height,-size_2,size_2,0);
                yCyl(LRadius,height,-size_2,-size_2,0);
                
                //top diagonal longerons
                if (topSupportRound) {
                    supportRound(sizeDiag_2,3,3,    -size_4,-size_4,height_2-sizeDiag_2/2,   45,90,0);
                    supportRound(sizeDiag_2,3,3,    -size_4,size_4,height_2-sizeDiag_2/2,   135,90,0);
                    supportRound(sizeDiag_2,3,3,    size_4,size_4,height_2-sizeDiag_2/2,   225,90,0);
                    supportRound(sizeDiag_2,3,3,    size_4,-size_4,height_2-sizeDiag_2/2,   315,90,0);
                } else {
                    yPoly(p10, szz=size*sin(45)*2, px=-size_2,py=-size_2,pz=height_2,      rx=0,ry=90, rz=45);
                    yPoly(p10, szz=size*sin(45)*2, px=-size_2,py=size_2,pz=height_2,      rx=0,ry=90, rz=-45);
                }//topSupportRound
            }//union
            
            //holes on top
            yCyl(LRadius/2,LRadius,size_2,size_2,height_2);
            yCyl(LRadius/2,LRadius,size_2,-size_2,height_2);
            yCyl(LRadius/2,LRadius,-size_2,size_2,height_2);
            yCyl(LRadius/2,LRadius,-size_2,-size_2,height_2);
            //side cuts
            yCube(LDiameter,size+LDiameter,height+1,size_2+LRadius);
            yCube(LDiameter,size+LDiameter,height+1,-size_2-LRadius);
            yCube(size+LDiameter,LDiameter,height+1,0,size_2+LRadius);
            yCube(size+LDiameter,LDiameter,height+1,0,-size_2-LRadius);
            
        }//diff
    }//transform
}//module  



module boxBottom(size=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        size_2 = size/2;
        size_4 = size/4;
        //p10=[[0,5],[10,0],[0,-5]];
        //p15=[[0,5],[10,0],[0,-15]];
        //p20=[[0,0],[10,0],[10,-5],[0,-20]];
        p10=[[0,3],[7,0],[0,-3]];
        p15=[[0,3],[7,0],[0,-10]];
        p20=[[0,0],[10,0],[10,-5],[0,-20]];
        pSide=[[0,0],[7,0],[0,-3]];
        union(){
            yCube(size,size,1.01,0,0,-size_2);                               
            //bottom sides
            yPoly(pSide, szz=size, px=size_2,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=0);
            yPoly(pSide, szz=size, px=-size_2,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=90);
            yPoly(pSide, szz=size, px=-size_2,py=-size_2,pz=-size_2,      rx=0,ry=-90, rz=180);
            yPoly(pSide, szz=size, px=size_2,py=-size_2,pz=-size_2,      rx=0,ry=-90, rz=270);   
            
            //bootom longerons    
            yPoly(p10, szz=size, px=size_2,py=0,pz=-size_2,      rx=0,ry=-90, rz=0);
            yPoly(p10, szz=size, px=0,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=90);
            
            //vertical langerons
            yPoly(p10,szz=size, px=-size_2,py=0,pz=-size_2,     rx=0);
            yPoly(p10,szz=size, px=size_2,py=0,pz=-size_2,      rx=0, rz=180);
            yPoly(p10,szz=size, px=0,py=size_2,pz=-size_2,      rx=0, rz=-90);
            yPoly(p10,szz=size, px=0,py=-size_2,pz=-size_2,     rx=0, rz=90);
        }//union
        supportRound(size_2,3,3,    0,-size_4,size_4,   0,90,0);
        supportRound(size_2,3,3,    -size_4,0,size_4,   90,90,0);
        supportRound(size_2,3,3,    0,size_4,size_4,   180,90,0);
        supportRound(size_2,3,3,    size_4,0,size_4,   270,90,0);
        
    }//transform
}//module

module supportRound(size=100, height=3, shift=0, px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        
        difference(){
            yCube(size,size,height);
            yCyl((size-shift),height*2, size/2,size/2);
            yCyl(size/5, height*2,-size/3.7,-size/2.8, sy=0.5);
            yCyl(size/9, height*2,-size/2.8,-size/6, sy=0.6);
            yCyl(size/15, height*2,-size/2.45, -size/50, sy=0.9);        
            yCyl(size/25, height*2,-size/2.25, size/10, sy=1.2);        
        }
        //yCyl(size/20, height*2,-size/2.3, size/10, sy=0.8);        
    }//transform
}//module


module boxBottomCyl (size=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        size_2 = size/2;
        size_4 = size/4;
        lRadius=6;
        //p10=[[0,5],[10,0],[0,-5]];
        //p15=[[0,5],[10,0],[0,-15]];
        //p20=[[0,0],[10,0],[10,-5],[0,-20]];
        p10=[[0,3],[7,0],[0,-3]];
        p15=[[0,3],[7,0],[0,-10]];
        p20=[[0,0],[10,0],[10,-5],[0,-20]];
        pSide=[[0,0],[7,0],[0,-3]];
        union(){
            yCube(size,size,0.7,0,0,-size_2);                               
            //bottom sides
            yPoly(pSide, szz=size, px=size_2,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=0);
            yPoly(pSide, szz=size, px=-size_2,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=90);
            yPoly(pSide, szz=size, px=-size_2,py=-size_2,pz=-size_2,      rx=0,ry=-90, rz=180);
            yPoly(pSide, szz=size, px=size_2,py=-size_2,pz=-size_2,      rx=0,ry=-90, rz=270);   
            
            //bottom longerons    
            yPoly(p10, szz=size, px=size_2,py=0,pz=-size_2,      rx=0,ry=-90, rz=0);
            yPoly(p10, szz=size, px=0,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=90);
            
            //vertical langerons
            yCyl(lRadius,size,size_2-lRadius,0,0);
            
            yCyl(lRadius,size,-size_2+lRadius,0,0);
            yCyl(lRadius,size,0,size_2-lRadius,0);
            yCyl(lRadius,size,0,-size_2+lRadius,0);
        }//union
        supportRound(size_2,3,3,    0,-size_4,size_4,   0,90,0);
        supportRound(size_2,3,3,    -size_4,0,size_4,   90,90,0);
        supportRound(size_2,3,3,    0,size_4,size_4,   180,90,0);
        supportRound(size_2,3,3,    size_4,0,size_4,   270,90,0);  
        
    }//transform
}//module    

