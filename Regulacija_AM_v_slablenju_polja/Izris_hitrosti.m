%izris hitrosti
c=60/2/pi;
figure
plot(time,wref*c)
grid on
hold on
plot(time,pp*w1*c)
%plot(time,pp*w2*c)
legend({'ref','tehA','tehB'},'Location','SouthEast')