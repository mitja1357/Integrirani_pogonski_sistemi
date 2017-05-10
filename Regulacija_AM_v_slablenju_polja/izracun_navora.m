%izracunaj navor

navor1=1.5*pp*Lm^2/Lr*Imr1.*Idq1(:,2);
%navor2=1.5*pp*Lm^2/Lr*Imr2(:,1).*Idq2(:,2);
navor1max=1.5*pp*Lm^2/Lr*Idq1(:,1).*Iqmax1;
%navor2max=1.5*pp*Lm^2/Lr*Idq2(:,1).*Iqmax2;
figure
plot(time,navor1);
hold on
plot(time,navor1max);
%plot(time,navor2);
%plot(time,navor2max);
grid on
legend({'tehA','tehB'})