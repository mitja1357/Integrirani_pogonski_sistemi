Rs=3.7;
Lss=10.7e-3;
Lm=234.2e-3;
Lsr=Lss;
Rr=2.2959;
Ls=Lss+Lm;
nn=1430;
fe=50;
UnRMS=400;
InRMS=5;
cosfi=0.78;
Mn=14.6;
pp=2; 
we=2*pi*fe;

Clark=(2/3)*[1 -0.5 -0.5; 0 sqrt(3)/2 -sqrt(3)/2; 0.5 0.5 0.5];

matrikaM=[0 -1; 1 0];
Ls=Lss+Lm;
Lr=Lsr+Lm;
k_s= Lm/Ls;
k_r=Lm/Lr;

L_sT=Ls-Lm^2/Lr;
L_rT=Lr-Lm^2/Ls;

J=0.01;