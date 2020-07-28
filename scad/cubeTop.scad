include <../../lib/lib.scad>
////~ 57g with CoPet/0.4mm filament/0.35mm z
main();

module main(px=0, py=0, pz=0, rx=0, ry=0, rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        _height = 50;
        union(){
            difference(){            
                yCube(200,200,_height );                               
                yCube(188.45,188.45,_height ,0,0,10.01);
            }//diff
            
                               
            //top gorizontal longerons
            yPoly(p=[[0,0],[10,0],[10,5],[15,5],[0,-20]],szz=180 ,px=-100,py=90,pz=(_height/2),rx=90);
            yPoly(p=[[0,0],[10,0],[10,5],[15,5],[0,-20]],szz=180 ,px=100,py=-90,pz=(_height/2),rx=-90,ry=180);        
            yPoly(p=[[0,0],[10,0],[10,5],[15,5],[0,-20]],szz=180 ,px=90,py=100,pz=(_height/2),rx=-90,ry=180,rz=90);
            yPoly(p=[[0,0],[10,0],[10,5],[15,5],[0,-20]],szz=180 ,px=-90,py=-100,pz=(_height/2),rx=-90,ry=180,rz=-90);
            
            //support
            yPoly(p=[[10,0],[0,15],[-10,0]],szz=200, px=-0,py=100, pz=(-_height/2+10), rx=90,ry=0,rz=0);        
            yPoly(p=[[10,0],[0,15],[-10,0]],szz=200, px=-100,py=0, pz=(-_height/2+10), rx=90,ry=0,rz=90);
        }//union
        
    }//transform
}//module
    