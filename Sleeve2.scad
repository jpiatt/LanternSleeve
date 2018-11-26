// Lantern Sleeve
//
// ABS sleeve to hold circuit board for ship's lamp project
//
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

union() {
    sleeve();
    translate([2,0,6]) mountingBracket();
}

module clipShelf() {
    difference() {
        difference() {
            color("LimeGreen") cube([5,20,4],true);
            translate([2,0,-2]) color("Blue") cube([6,21,3], true);
        };
        sleeve();
    }
}

module bottomShelf() {
    difference() {
        translate([-3,0,0]) color("LimeGreen")  cube([10,20,4],true);
        translate([-7,0,2]) cube([2,21,2],true);
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

module mountingBracket() {
  translate([29.5,0,-34]) bottomShelf();
  translate([26,0,8]) clipShelf();
  difference() {
    translate([26.5,0,-38.5]) rotate([0,90,0]) cylinder(10,4,4, true);
    translate([26,0,-38.5]) rotate([0,90,0]) cylinder(12,2,2, true);
  }
}
echo(version=version());
