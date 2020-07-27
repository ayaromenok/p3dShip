include <../../lib/lib.scad>

main();

module main(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        union(){
            difference(){            
                yCube(200,200,200);                               
                yCube(198.45,198.45,200,0,0,1.01);
            }//diff
            
            //vertical langerons
                yCube(10,0.75,200,95,0,0);
                yCube(10,0.75,200,-95,0,0);
                yCube(10,0.75,200,0,95,0, 0,0,90);
                yCube(10,0.75,200,0,-95,0, 0,0,90);
        
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
    