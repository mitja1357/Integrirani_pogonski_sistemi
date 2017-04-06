clc;
clear all;
close all;
naloga_1_1

norm_Us=U_s/abs(U_s);
norm_Is=I_s/abs(I_s);
norm_Ir=I_r/abs(I_s);
norm_Im=I_m/abs(I_s);
norm_flux_s=flux_s/abs(flux_s);
norm_flux_r=flux_r/abs(flux_s);
norm_flux_m=flux_m/abs(flux_s);

 COMPASS(norm_Us,'-r')
 hold on;
 COMPASS(norm_Is,'-g');
 COMPASS(norm_Ir,'-b');
 COMPASS(norm_Im,'-m');
 COMPASS(norm_flux_s,'-g');
 COMPASS(norm_flux_r,'-b');
 COMPASS(norm_flux_m,'-m');
 kot_fluxr_ir=Kotflux_r-KotI_r
 
 % kot se ne spremeni
