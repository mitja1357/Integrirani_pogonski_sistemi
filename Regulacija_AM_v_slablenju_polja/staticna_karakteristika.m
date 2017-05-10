
clear all
naklon=10;
%v radiane na sekundo
naklon= naklon*2*pi/60;
static=5;
dinamic=0;


static_or_dinamic=static;
 tic
 close all;
 duration=140*4;
ali_naj_bo_limita_w_ali_wmr=0; 
%inicializacija 
parametriAM;

%zazeni simulacijo
options=simset('SrcWorkspace','base','DstWorkspace','base');
set_param('Model_IPS7', 'SolverName','VariableStepAuto');
sim('Model_IPS7', [0,duration],options);

 
 %izris zeljenih vrednosti v odvistnosti od rpm
 
figure('Name','Idref','NumberTitle','off')
plot(wdej1*60/2/pi,Idref1)
hold on
plot(wdej2*60/2/pi,Idref2)
plot(wdejs*60/2/pi,Idrefnemec)
grid on
xlabel('vrtilna hitrost / min^{-1}');
ylabel('I_{d}^* / A');
legend('Prva metoda','Druga metoda', 'Standardna metoda')
%axis([0 4500 10 28])

do=max(size(time));%find(wdej1*60/2/pi>4500/3,1);
figure('Name','Navormax','NumberTitle','off')
plot(wdej1(1:do).*60/2/pi,Mmax1(1:do))
hold on
plot(wdej2(1:do).*60/2/pi,Mmax2(1:do))
plot(wdejs(1:do).*60/2/pi,Mmaxs(1:do))
grid on
xlabel('vrtilna hitrost/ min^{-1}');
ylabel('M_{max}/Nm');
legend('Prva metoda','Druga metoda', 'Standardna metoda')
%axis([0 4500 1.5 3])
 
 

%{
%%Prva tehnika za dolocit IQMAX
a1=Udc/(wdej1*Ls);
a1=transpose(a1);
b1=Udc/(wdej1*Lst);
b1=transpose(b1);
iq1a=abs(b1.*sqrt(1-(Id1./a1).^2));
iq1b=sqrt(Ismax^2-Id1.^2);
iq1=[iq1a,iq1b];
for i=1:max(size(iq1))
    iq1max(i)=max(iq1(i,:));
    
end
 iq1max=transpose(iq1max);
%%Druga tehnika za dolocit IQMAX
a1=Udc/(wdej2*Ls);
a1=transpose(a1);
b1=Udc/(wdej2*Lst);
b1=transpose(b1);
iq1a=abs(b1.*sqrt(1-(Id2./a1).^2));
iq1b=sqrt(Ismax^2-Id2.^2);
iq1=[iq1a,iq1b];
for i=1:max(size(iq1))
    iq2max(i)=max(iq1(i,:));
    
end
 iq2max=transpose(iq2max);
%%Standardna tehnika za dolocit IQMAX
a1=Udc/(wdejs*Ls);
a1=transpose(a1);
b1=Udc/(wdejs*Lst);
b1=transpose(b1);
iq1a=abs(b1.*sqrt(1-(Ids./a1).^2));
iq1b=sqrt(Ismax^2-Ids.^2);
iq1=[iq1a,iq1b];
for i=1:max(size(iq1))
    iqsmax(i)=max(iq1(i,:));
    
end
 iqsmax=transpose(iqsmax);

%}
 toc