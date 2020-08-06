include <../../../lib/lib.scad>

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