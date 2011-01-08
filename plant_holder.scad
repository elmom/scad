// Copyright 2010 Elmo Mäntynen
// Licensed as GPL 2 or later

// This is a holder for plants, to be used for indoor gardening.
// Idea is from the zengrow.com systems.

// This should hold the plants in holes made to the lid (or other sheet)
// of a water container. A pump pumps the water through a tube, and the
// other end of the tube is held over the plant. The water then returns
// to the container after passing the plant's roots.

include <MCAD/units.scad>
use <MCAD/shapes.scad>

// Plant hole dimensions
width = 7*cm;
length = 9.5*cm;

// Tube holder
tubeOD = 12*mm;

screw_hole = 4*mm;

union(){
    linear_extrude(height=10*mm)
    difference(){
        union(){
            egg_outline(width=width+10*mm, length=length+10*mm);
            translate([0, -1*cm, 0]) cross(5*cm+width, 5*cm+length, 2*cm);
        }
        egg_outline(width=width, length=length);
    }
    translate([0, width/2+20*mm, 20*mm]) tube_holder();
}

module cross(x, y, thickness){
    union(){
        difference(){
            square([x, thickness], center=true);
            for(i = [-1, 1]){
                translate([i*(x/2-screw_hole-5*mm), 0, 0]) circle(r=screw_hole, center=true);
            }
        }
        square([thickness, y], center=true);
    }
}

module tube_holder(){
    difference(){
        box(20*mm, 10*mm, 40*mm);
        translate([0, 0, 10*mm]) rotate([90, 0, 0])
            cylinder(r=tubeOD/2+0.5*mm, h=20*mm, center=true);
    }
}

