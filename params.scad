// EVW Pot Model
// Developed by: Michael McCool
// Depends on: 
//   https://github.com/mmccool/openscad-library (put in OPENSCADPATH)
include <tols.scad>

// Uncomment "model" to speed rendering during modelling,
// "make" when ready to export STL
include <smooth_model.scad>
//include <smooth_make.scad>

EVW_pot_x = 10.6;
EVW_pot_bx = 8.4;
EVW_pot_ty = 5.3;
EVW_pot_tye = 6.7;
EVW_pot_by = 7.35;
EVW_pot_bye = 8.7;
EVW_pot_my = 5.1;
EVW_pot_mye = EVW_pot_my + 2*1.0;
EVW_pot_mxe = EVW_pot_x - 2*0.3;
EVW_pot_y = EVW_pot_ty + EVW_pot_by;
EVW_pot_ye = EVW_pot_tye + EVW_pot_bye;
EVW_pot_z = 2.2; // not including sleeve
EVW_pot_sleeve_h = 0.8;
EVW_pot_sleeve_r = (5.0 + 0.1)/2;
EVW_pot_sleeve_ir = (4.0 + 0.1)/2;
EVW_pot_sleeve_ih = 0.6;
EVW_pot_sleeve_hr = (3.0 + 0.1)/2;
EVW_pot_sleeve_dr = 0.05;
EVW_pot_sleeve_R = 6.0/2;
EVW_pot_lead_s = 2.5;
EVW_pot_lead_tw = 2.6;
EVW_pot_lead_bw = 1;
EVW_pot_lead_h = 0.2;
EVW_pot_lead_tye = EVW_pot_tye - EVW_pot_ty;
EVW_pot_lead_bye = EVW_pot_bye - EVW_pot_by;
EVW_pin_h = 1.2;
EVW_pin_r = 1.0/2;
EVW_hole1_r = 1.3/2;
EVW_hole1_h = 1.1 + 0.05;
EVW_hole2_r = (1.1 + 0.05)/2;
EVW_pin_s = 9.4; 
EVW_hole_s = 9.4; 
EVW_hole_s_tol = 0.05; 
EVW_pot_sm = 4*sm;
 
