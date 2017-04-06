close all;
clear all;
clc;

Rs=3.7;
Lss=10.7e-3;
Lm=234.2e-3;
Lsr=Lss;
Rr=2.2959;
Ls=Lss+Lm;
nn=1430;
fn=50;
UnRMS=400;
InRMS=5;
cosfi=0.78;
Mn=14.6;
pp=2;
wn=2*pi*fn;

%%%Naloga 1.1%%%

sn=1-(nn/60)/(fn/pp);%% (ns-nn)/ns ns je odvisna od polovih parov

Rr/sn;
Zs=Rs+j*wn*Lss;
Zr=Rr/sn +j*wn*Lsr;
Zm=j*wn*Lm;

AbsZr=abs(Zr);
KotZr=angle(Zr)*180/pi;
AbsZm=abs(Zm);
KotZm=angle(Zm)*180/pi;
AbsZs=abs(Zs);
KotZs=angle(Zs)*180/pi;

Zvh=Zs+(Zm*Zr)/(Zm+Zr);
AbsZvh=abs(Zvh);
KotZvh=angle(Zvh)*180/pi;

U_s=UnRMS*sqrt(2)/sqrt(3);
AbsU_s=abs(U_s);
KotU_s=angle(U_s)*180/pi;

I_s=U_s/Zvh;
AbsI_s=abs(I_s);
KotI_s=angle(I_s)*180/pi;

cosfinazivni=cos((KotU_s-KotI_s)*pi/180);
I_r=-(U_s-I_s*Zs)/Zr;%tok tece v zgornje vozlisce
I_m=(U_s-I_s*Zs)/Zm;

AbsI_r=abs(I_r);
KotI_r=angle(I_r)*180/pi;

AbsI_m=abs(I_m);
KotI_m=angle(I_m)*180/pi;

% 9
flux_s=I_s*Lss+I_m*Lm;
Absflux_s=abs(flux_s);
Kotflux_s=angle(flux_s)*180/pi;
flux_r=I_r*Lsr+I_m*Lm;
Absflux_r=abs(flux_r);
Kotflux_r=angle(flux_r)*180/pi;
flux_m=I_m*Lm;
Absflux_m=abs(flux_m);
Kotflux_m=angle(flux_m)*180/pi;
%10
Pe=(3/2)*real(U_s*conj(I_s));
Peklasicni=sqrt(3)*cosfi*UnRMS*InRMS;

%11
Me=(3/2)*pp*Lm*imag(I_s*conj(I_r))

Pm=Me*wn