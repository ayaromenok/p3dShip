include <../../lib/lib.scad>
boxBottom(200);

//supportRound();
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
        }
    }//transform
}//module
    