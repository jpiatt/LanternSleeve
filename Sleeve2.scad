// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

union() {
    sleeve();
    translate([29.5,0,-33]) bottomShelf();
    #translate([25,0,-12]) rotate([0,85,0]) board();
    translate([26,0,8]) clipShelf();
}
module bottomShelf() {
    difference() {
        color("LimeGreen")  cube([10,20,3],true);
        sleeve();
    }
}

module sleeve() {
    difference() {
        cylinder(73, 36.5, 31, true);
        cylinder(77, 34.5, 28.5, true);
    }
}

module board() {
    color("Red") cube([40,20,2], true);
}

module clipShelf() {
    difference() {
        difference() {
            color("LimeGreen") cube([10,20,3],true);
            translate([4,0,-3]) cube([16,21,5], true);
        };
        sleeve();
    }
}
echo(version=version());