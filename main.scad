// EVW Pot Model
// Developed by: Michael McCool
// Depends on: 
//   https://github.com/mmccool/openscad-library (put in OPENSCADPATH)
include <tols.scad>

// Uncomment "model" to speed rendering during modelling, "make" when ready to export STL
include <smooth_model.scad>
//include <smooth_make.scad>

sm = 8*sm_base;

include <params.scad>
 
module EVW_pot() {
  difference() {
    union() {
      cylinder(r=EVW_pot_ty,h=EVW_pot_z,$fn=sm);
      translate([-EVW_pot_x/2,-EVW_pot_my/2,0]) cube([EVW_pot_x,EVW_pot_my,EVW_pot_z]);
      translate([-EVW_pot_mxe/2,-EVW_pot_mye/2,0]) cube([EVW_pot_mxe,EVW_pot_mye,EVW_pot_z]);
      translate([-EVW_pot_bx/2,-EVW_pot_by,0]) cube([EVW_pot_bx,EVW_pot_by,EVW_pot_z]);
      translate([-EVW_pin_s/2,0,-EVW_pin_h]) cylinder(r=EVW_pin_r,h=EVW_pin_h+EVW_pot_z,$fn=sm);
      translate([ EVW_pin_s/2,0,-EVW_pin_h]) cylinder(r=EVW_pin_r,h=EVW_pin_h+EVW_pot_z,$fn=sm);
      difference() {
        translate([0,0,-EVW_pot_sleeve_h]) cylinder(r=EVW_pot_sleeve_r,h=EVW_pot_sleeve_h+EVW_pot_z,$fn=sm);
      }
    }
    difference() {
      translate([0,0,-EVW_pot_sleeve_h-1]) cylinder(r=EVW_pot_sleeve_ir,h=EVW_pot_sleeve_h+EVW_pot_z+2,$fn=sm);
      translate([-2.1*EVW_pot_sleeve_ir/2,(EVW_pot_sleeve_ir-EVW_pot_sleeve_hr),-EVW_pot_sleeve_ih-1]) 
        cube([2.1*EVW_pot_sleeve_ir,2.1*EVW_pot_sleeve_ir,EVW_pot_sleeve_h+EVW_pot_z+4]);
    }
  }
  // bottom leads
  translate([-EVW_pot_lead_bw/2,-EVW_pot_bye,0]) 
    cube([EVW_pot_lead_bw,EVW_pot_bye-EVW_pot_by+1,EVW_pot_lead_h]);
  translate([EVW_pot_lead_s-EVW_pot_lead_bw/2,-EVW_pot_bye,0]) 
    cube([EVW_pot_lead_bw,EVW_pot_bye-EVW_pot_by+1,EVW_pot_lead_h]);
  translate([-EVW_pot_lead_s-EVW_pot_lead_bw/2,-EVW_pot_bye,0]) 
    cube([EVW_pot_lead_bw,EVW_pot_bye-EVW_pot_by+1,EVW_pot_lead_h]);
  // top lead
  translate([-EVW_pot_lead_tw/2,EVW_pot_ty-1,0]) 
    cube([EVW_pot_lead_tw,EVW_pot_tye-EVW_pot_ty+1,EVW_pot_lead_h]);
}

EVW_pot();
