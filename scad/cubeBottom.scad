include <../../lib/lib.scad>
//~ 60g with CoPet/0.4mm filament/0.35mm z
main();

module main(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        union(){
            difference(){            
                yCube(200,200,200);                               
                yCube(198.45,198.45,200,0,0,1.01);
            }//diff
            //bootom longerons    
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=200 ,px=100,py=0,pz=-100,rx=0,ry=-90, rz=0);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=200 ,px=0,py=100,pz=-100,rx=0,ry=-90, rz=90);
            
            //vertical langerons
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=200 ,px=-100,py=0,pz=-100,    rx=0);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=200 ,px=100,py=0,pz=-100,     rx=0, rz=180);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=200 ,px=0,py=100,pz=-100,rx=0, rz=-90);
            yPoly(p=[[0,5],[10,0],[0,-5]],szz=200 ,px=0,py=-100,pz=-100,rx=0, rz=90);
              
                //mid-section gorizontal longeron
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=200 ,px=-100,py=100,pz=0,rx=90);
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=200 ,px=100,py=-100,pz=0,rx=-90,ry=180);        
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=200 ,px=100,py=100,pz=0,rx=-90,ry=180,rz=90);
            yPoly(p=[[0,5],[10,0],[0,-15]],szz=200 ,px=-100,py=-100,pz=0,rx=-90,ry=180,rz=-90);
                
                //top gorizontal longerons
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=200 ,px=-100,py=100,pz=100,rx=90);
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=200 ,px=100,py=-100,pz=100,rx=-90,ry=180);        
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=200 ,px=100,py=100,pz=100,rx=-90,ry=180,rz=90);
            yPoly(p=[[0,0],[10,0],[10,-5],[0,-20]],szz=200 ,px=-100,py=-100,pz=100,rx=-90,ry=180,rz=-90);
        }//union
        
    }//transform
}//module
    