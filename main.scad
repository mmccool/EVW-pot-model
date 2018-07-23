// EVW Pot Model
// Developed by: Michael McCool
// Depends on: 
//   https://github.com/mmccool/openscad-library (put in OPENSCADPATH)
include <tols.scad>
include <smooth.scad>
include <params.scad>
 
module EVW_top_lead(t=0) {
  translate([-EVW_pot_lead_tw/2-t,EVW_pot_ty-1,-t]) 
    cube([EVW_pot_lead_tw+2*t,EVW_pot_tye-EVW_pot_ty+1+t,EVW_pot_lead_h+2*t]);
}
module EVW_bot_leads(t=0) {
  translate([-EVW_pot_lead_bw/2-t,-EVW_pot_bye-t,-t]) 
    cube([EVW_pot_lead_bw+2*t,EVW_pot_bye-EVW_pot_by+1+t,EVW_pot_lead_h+2*t]);
  translate([EVW_pot_lead_s-EVW_pot_lead_bw/2-t,-EVW_pot_bye-t,-t]) 
    cube([EVW_pot_lead_bw+2*t,EVW_pot_bye-EVW_pot_by+1+t,EVW_pot_lead_h+2*t]);
  translate([-EVW_pot_lead_s-EVW_pot_lead_bw/2-t,-EVW_pot_bye-t,-t]) 
    cube([EVW_pot_lead_bw+2*t,EVW_pot_bye-EVW_pot_by+1+t,EVW_pot_lead_h+2*t]);
}
module EVW_leads(t=0) {
  EVW_top_lead(t=t);
  EVW_bot_leads(t=t);
}
module EVW_sleeve(t=0,rt=0) {
  translate([0,0,-EVW_pot_sleeve_h-t-rt]) 
    cylinder(r=EVW_pot_sleeve_r+t,h=EVW_pot_sleeve_h+EVW_pot_z+t+rt,$fn=EVW_sleeve_sm);
}
module EVW_pins(t=0) {
  translate([-EVW_pin_s/2,0,-EVW_pin_h-t]) cylinder(r=EVW_pin_r+t,h=EVW_pin_h+EVW_pot_z+2*t,$fn=EVW_pin_sm);
  translate([ EVW_pin_s/2,0,-EVW_pin_h-t]) cylinder(r=EVW_pin_r+t,h=EVW_pin_h+EVW_pot_z+2*t,$fn=EVW_pin_sm);
}
module EVW_pot(leads=true,pins=true,sleeve=true,t=0,rt=0) {
  translate([0,0,-EVW_pot_z]) difference() {
    union() {
      translate([0,0,-t]) cylinder(r=EVW_pot_ty+t,h=EVW_pot_z+2*t,$fn=EVW_pot_sm);
      translate([-EVW_pot_x/2-t,-EVW_pot_my/2-t,-t]) cube([EVW_pot_x+2*t,EVW_pot_my+2*t,EVW_pot_z+2*t]);
      translate([-EVW_pot_mxe/2-t,-EVW_pot_mye/2-t,-t]) cube([EVW_pot_mxe+2*t,EVW_pot_mye+2*t,EVW_pot_z+2*t]);
      translate([-EVW_pot_bx/2-t,-EVW_pot_by-t,-t]) cube([EVW_pot_bx+2*t,EVW_pot_by+2*t,EVW_pot_z+2*t]);
      if (pins) {
        EVW_pins(t);
      }
      if (sleeve) {
        EVW_sleeve(t,rt);
      }
    }
    // D shaft hole
    difference() {
      translate([0,0,-EVW_pot_sleeve_h-1]) cylinder(r=EVW_pot_sleeve_ir,h=EVW_pot_sleeve_h+EVW_pot_z+2,$fn=sm);
      translate([-2.1*EVW_pot_sleeve_ir/2,(EVW_pot_sleeve_ir-EVW_pot_sleeve_hr),-EVW_pot_sleeve_ih-1]) 
        cube([2.1*EVW_pot_sleeve_ir,2.1*EVW_pot_sleeve_ir,EVW_pot_sleeve_h+EVW_pot_z+4]);
    }
  }
  if (leads) {
    translate([0,0,-EVW_pot_z]) EVW_leads(t);
  }
}

module EVW_body_hull(t=0,rt=0) {
  hull() {
    EVW_pot(leads=false,pins=false,sleeve=false,t=t,rt=rt);
  }
}
module EVW_leads_hull(t=0) {
  translate([0,0,-EVW_pot_z]) hull() {
    EVW_leads(t);
  }
}
module EVW_bot_leads_hull(t=0) {
  translate([0,0,-EVW_pot_z]) hull() {
    EVW_bot_leads(t);
  }
}
module EVW_top_lead_hull(t=0) {
  translate([0,0,-EVW_pot_z])
    EVW_top_lead(t);
}
// hull for placement
module EVW_hull(t=0.3) {
  EVW_body_hull(t);
  EVW_leads_hull(t);
  translate([0,0,-EVW_pot_z]) EVW_sleeve(t=t,rt=t);
  translate([0,0,-EVW_pot_z]) EVW_pins(t=2*t/3);
}

EVW_pot();
//EVW_pot(leads=false,pins=false,sleeve=false);
//EVW_body_hull();
//EVW_leads();
//EVW_leads_hull();
color([0.5,0.3,0.3,0.5]) EVW_hull();
