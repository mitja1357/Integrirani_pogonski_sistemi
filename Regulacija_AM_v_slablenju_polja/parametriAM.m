%% parametri motorja
%clear;
%ko=mojkont;
%static_or_dinamic=static_or_dinamic;
% Letrika 500 W, 15 V
%naklon= naklon;


Pn=0.5;       % kW
Mn = 2.5;       % Nm
Un = 15;        % V	
Imrn = 18.7;    % A
In = 28.4;      % A
nN = 2200;      % rpm

Rs = 0.074;     % ?
Rr = 0.0513;    % ?
Ls = 0.002596;  % H
Lr = 0.002559;  % H
Lm = 0.0024;    % H
pp = 1;         % polov par	
J = 0.001;
 

% 3 kW Indramat AD100B
%{
Pn = 3000;      % nazivna moc
Mn = 20;        % nazivni navor
Un = 177;       % nazivna napetost
In = 14.71;     % nazivni tok
Imrn = 8.76;    % nazivni magnetilni tok
Rs = 0.214;     % statorska upornost
Rr = 0.231;     % rotorska upornost
Ls = 0.035466;  % statorska induktivnost
Lr = 0.035011;  % rotoska induktivnost
Lm = 0.034122;  % magnetilna induktivnost
pp = 2;         % stevilo polovih parov
J = 1*0.014752;     % vztrajnost
%}


% 4,7 kW Indramat, oznaka: "REXROTH 4,7 kW
%{
Un = 216;       % nazivna napetost
In = 12.7;      % nazivni tok
Imrn = 7.4;     % nazivni magnetilni tok
Rs = 0.594;     % statorska upornost
Rr = 0.689;     % rotorska upornost
Ls = 0.05315;   % statorska induktivnost
Lr = 0.05315;   % rotorska induktivnost
Lm = 0.0493;    % Medsebojna induktivnost
pp = 3;         % stevilo polovih parov
J = 0.019;      % vztrajnost
%}

%% izpeljani parametri
% statorska casovna konstanta
%Ts = Ls/Rs;
% rotorska casovna konstanta


Tr = Lr/Rr;

sigmaR = (Lr-Lm)/Lm;
sigmaS = (Ls-Lm)/Lm;
sigma = 1 - 1/((1+sigmaR)*(1+sigmaS));



Lst=sigma*Ls;



%% parametri za termiko
% temperaturna prevodnost med statorjem in zrakom
T_st_amb = 1;
% temperaturna prevodnost med rotorjem in statorjem
T_st_rot = 0.001;

% temperaturna kapaciteta statorja
Cth_stat = 0.01;
% temperaturna kapaciteta rotorja
Cth_rot = 0.001;

%% parametri regulatorjev
% parametri tokovnih regulatorjev
Kp_tok = 0.05;
Ki_tok = 5.0;

% parametri regulatorja fluksa
Kp_Imr = 100;%prej je bil 200
Ki_Imr = 1000;

% parametri regulatorja hitrosti
Kp_wr = 50;
Ki_wr = 1000;

% parametri regulatorja napetosti
Kp_U = 0.0066;
Ki_U = 100;

%% parametri pretvornika, regulacije
% preklopna in vzorcna frekvenca
Fstikalna = 10000;
% preklopna in vzorcna perioda
Tstikalna = 1/Fstikalna;
% napetost enosmernega tokokroga
Udc = Un*sqrt(2/3*2);

%% slablenje polja
omega_weak =  (((Udc*sqrt(3)/2)/(Un*sqrt(2)))/pp) * 50 *2*pi  * 0.9;


Ismax=In*sqrt(2);
Usmax=Udc;


wn=Udc/sqrt(Ls^2*(Imrn)^2+Lst^2*(Ismax^2-(Imrn)^2))/pp/sqrt(2);


nN=wn*60/2/pi;
wb_upper_limit_field_weaking=sqrt((Ls^2+Lst^2)/(2*Lst^2*Ls^2))*Un/Ismax;

wdod=2000*2*pi/60;
fcutoff=10000;
taufiltra=1/(2*pi*fcutoff);
Element=150;
Rs_oc = Rs;     % ocenjena statorska upornost
Rr_oc = Rr;     % ocenjena rotorska upornost
Ls_oc = Ls;     % ocenjena statorska induktivnost
Lr_oc = Lr;     % ocenjena rotoska induktivnost
Lm_oc = Lm;     % ocenjena magnetilna induktivnost
Tr_oc = Lr_oc/Rr_oc;

sigmaR_oc = (Lr_oc-Lm_oc)/Lm_oc;
sigmaS_oc = (Ls_oc-Lm_oc)/Lm_oc;
sigma_oc = 1 - 1/((1+sigmaR_oc)*(1+sigmaS_oc));
