close all
id=linspace(0,Ismax,1000);
iq=sqrt(Ismax^2-id.^2);
wn=Udc/sqrt(Ls^2*(Imrn)^2+Lst^2*(Ismax^2-(Imrn)^2));
a=Udc/Ls/wb_upper_limit_field_weaking;
b=Udc/wb_upper_limit_field_weaking/Lst;

ud1=b*sqrt(1-id.^2/a^2);
a=Udc/Ls/wn/2;
b=Udc/wn/2/Lst;
ud2=b*sqrt(1-id.^2/a^2);
a=Udc/Ls/wn;
b=Udc/wn/Lst;
ud3=b*sqrt(1-id.^2/a^2);
figure
plot(id,iq);
hold on
plot(id,ud1);
plot(id,ud2);
plot(id,ud3);
grid on
axis equal