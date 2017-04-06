clear all;
close all;
clc;
a=exp(1i*2*pi/3);
we=100*pi;
t1=3e-3;
%%%%%%%%%%%%
%Naloga 1.1%
%%%%%%%%%%%%
%Tocka 1
Is=10*exp(1i*we*t1)
%Tocka 2
abs_Is=abs(Is)
kot_Is=angle(Is)
%Tocka 3
ias=real(Is)
%Tocka 4 ibs=|Is|cos(vmesnega kota)=|Is|cos(theta-3pi/4)
%   Real(Is*e)
ibs1=abs_Is*cos(kot_Is-2*pi/3)
ibs2=real(Is*a^2)%a^2=exp(-j2pi/3)
%Tocka 5
ics1=abs_Is*cos(kot_Is+2*pi/3)
ics2=real(a*Is)%zavrtimo za kot -240=120

%Tocka 6

Is_izkomponent=2/3*(ias+a*ibs1+a^2*ics1)
razlika_v_izracunu=Is_izkomponent-Is



%Tocka 7

t=linspace(0,0.02,100);
potek_Is=10*exp(1j*we*t);
potek_Isa=real(potek_Is);
plot(t,potek_Isa);
hold on;
grid on;
potek_Isb=real(potek_Is*a^2);
potek_Isc=real(potek_Is*a);
plot(t,potek_Isb,'-g');
plot(t,potek_Isc,'-m');
legend('Ia','Ib','Ic');

figure
plot(real(potek_Is),imag(potek_Is))
grid on;

%Tocka 

%P_m=3/2*wr*L_m*Imag(Is*conj(Ir))
%M_e=P_m/w_rm=3/2*p_p*L_m*Imag(Is*conj(Ir))
%i_r x i_s =Imag(Is*conj(Ir)) x vektorsko mnozenje
