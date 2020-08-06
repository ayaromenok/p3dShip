include <../../lib/lib.scad>
include <libShip/libShip.scad>


sideBottomCyl_4(100);
//sideFrontBottomCyl_4(100);



module sideBottomCyl_4 (size=200, height=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0, topSupportRound=false){
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
                yCube(size,0.79,height,0,size_2-0.395,0);

                //bottom sides
                yPoly(pSide, szz=size, px=size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=0);
                yPoly(pSide, szz=size, px=-size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=90);
                yPoly(pSide, szz=size, px=-size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=180);
                yPoly(pSide, szz=size, px=size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=270);   
            
                //bottom diagonal longerons    
                yPoly(p10, szz=size*sin(45)*2, px=size_2,py=size_2,pz=-height_2,      rx=0,ry=-90, rz=45);
                yPoly(p10, szz=size*sin(45)*2, px=size_2,py=-size_2,pz=-height_2,      rx=0,ry=-90, rz=-45);
            
                //vertical langerons
                yCyl(LRadius,height,    size_2,size_2,0, sy=2);
                yCyl(LRadius,height,    size_2,-size_2,0);
                yCyl(LRadius,height,    -size_2,size_2,0,sy=2);
                yCyl(LRadius,height,    -size_2,-size_2,0);
                
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
            yCube(LDiameter,size+LDiameter,height+1,size_2+LRadius);
            yCube(LDiameter,size+LDiameter,height+1,-size_2-LRadius);
            yCube(size+LDiameter,LDiameter,height+1,0,size_2+LRadius);
            yCube(size+LDiameter,LDiameter,height+1,0,-size_2-LRadius);
            
        }//diff
        
        
    }//transform
}//module  

//translate([0,0,-height_2])    
//                linear_extrude(1, $fn=200)
//                scale([size/100,size/100,1])
//                    import("../dxf/profileHullFront.dxf");
//                yCube(size,size,0.7,0,0,-height_2);       