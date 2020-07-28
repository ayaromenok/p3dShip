include <../../lib/lib.scad>
//~ 60g with CoPet/0.4mm filament/0.35mm z - 101181mm/14h

cubeBottom();
//cubeBottom(100);

module cubeBottom(size=200, px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        size_2 = size/2;
        union(){
            difference(){            
                yCube(size,size,size);                               
                yCube((size-1.55),(size-1.55), size,0,0,1.01);
            }//diff
            //bootom longerons    
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=size, px=size_2,py=0,pz=-size_2,      rx=0,ry=-90, rz=0);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=size, px=0,py=size_2,pz=-size_2,      rx=0,ry=-90, rz=90);
            
            //vertical langerons
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=size, px=-size_2,py=0,pz=-size_2,     rx=0);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=size, px=size_2,py=0,pz=-size_2,      rx=0, rz=180);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=size, px=0,py=size_2,pz=-size_2,      rx=0, rz=-90);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=size, px=0,py=-size_2,pz=-size_2,     rx=0, rz=90);
              
                //mid-section gorizontal longeron
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=size, px=-size_2,py=size_2,pz=0,     rx=90);
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=size, px=size_2,py=-size_2,pz=0,     rx=-90,ry=180);        
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=size, px=size_2,py=size_2,pz=0,      rx=-90,ry=180,rz=90);
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=size, px=-size_2,py=-size_2,pz=0,    rx=-90,ry=180,rz=-90);
                
                //top gorizontal longerons
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=size, px=-size_2,py=size_2,pz=size_2,     rx=90);
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=size, px=size_2,py=-size_2,pz=size_2,     rx=-90,ry=180);        
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=size, px=size_2,py=size_2,pz=size_2,      rx=-90,ry=180,rz=90);
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=size, px=-size_2,py=-size_2,pz=size_2,    rx=-90,ry=180,rz=-90);
        }//union
        
    }//transform
}//module
    