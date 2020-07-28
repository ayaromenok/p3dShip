include <../../lib/lib.scad>
//~ 60g with CoPet/0.4mm filament/0.35mm z - 101181mm/14h
//92797mm ~13.25h
cubeBottom();
//cubeBottom(50);

module cubeBottom(size=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        size_2 = size/2;
        //p10=[[0,5],[10,0],[0,-5]];
        //p15=[[0,5],[10,0],[0,-15]];
        //p20=[[0,0],[10,0],[10,-5],[0,-20]];
        p10=[[0,3],[7,0],[0,-3]];
        p15=[[0,3],[7,0],[0,-10]];
        p20=[[0,0],[10,0],[10,-5],[0,-20]];
        union(){
            difference(){            
                yCube(size,size,size);                               
                yCube((size-1.55),(size-1.55), size,0,0,1.01);
            }//diff
            //bootom longerons    
            yPoly(p10, szz=size, px=size_2,py=0,pz=-size_2,      rx=0,ry=-90, rz=0);
            yPoly(p10, szz=size, px=0,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=90);
            
            //vertical langerons
            yPoly(p10,szz=size, px=-size_2,py=0,pz=-size_2,     rx=0);
            yPoly(p10,szz=size, px=size_2,py=0,pz=-size_2,      rx=0, rz=180);
            yPoly(p10,szz=size, px=0,py=size_2,pz=-size_2,      rx=0, rz=-90);
            yPoly(p10,szz=size, px=0,py=-size_2,pz=-size_2,     rx=0, rz=90);
              
                //mid-section gorizontal longeron
            yPoly(p15,szz=size, px=-size_2,py=size_2,pz=0,     rx=90);
            yPoly(p15,szz=size, px=size_2,py=-size_2,pz=0,     rx=-90,ry=180);        
            yPoly(p15,szz=size, px=size_2,py=size_2,pz=0,      rx=-90,ry=180,rz=90);
            yPoly(p15,szz=size, px=-size_2,py=-size_2,pz=0,    rx=-90,ry=180,rz=-90);
                
                //top gorizontal longerons
            yPoly(p20,szz=size, px=-size_2,py=size_2,pz=size_2,     rx=90);
            yPoly(p20,szz=size, px=size_2,py=-size_2,pz=size_2,     rx=-90,ry=180);        
            yPoly(p20,szz=size, px=size_2,py=size_2,pz=size_2,      rx=-90,ry=180,rz=90);
            yPoly(p20,szz=size, px=-size_2,py=-size_2,pz=size_2,    rx=-90,ry=180,rz=-90);
        }//union
        
    }//transform
}//module
    