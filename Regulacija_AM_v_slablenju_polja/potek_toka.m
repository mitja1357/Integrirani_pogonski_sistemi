%potek toka
%{
absulute1=sqrt(Idq1(:,1).^2+Idq1(:,2).^2);
absulute2=sqrt(Idq2(:,1).^2+Idq2(:,2).^2);



figure
plot(time,absulute1)
hold on
grid on
plot(time, absulute2)
plot(time,Iqmax1)
plot(time,Iqmax2)

legend({'tehA','tehB','tehAmax','tehBmax'},'Location','NorthEast')
%}


%{
tic;
clear all
st=0.95;
sto=1.15;
kor=0.01;
A=zeros(1/kor,2);

for mojkont=st:kor:sto


parametriAM;
sim('Model_IPS7');
%kje naj iscem
%{
odcasa=find(time>0.74,1);
arr=M2(odcasa:size(M2,1));
element=find(arr<0.5,1);
A(floor(mojkont/kor+(1-st/kor)),1)=mojkont;
A(floor(mojkont/kor+(1-st/kor)),2)=time(element+odcasa)-0.7;


close all;
figure('Name','navor','NumberTitle','off')
plot(time,M1)
title(num2str(filtkonst));
hold on
plot(time,M2)
grid on
xlabel('cas/s');
ylabel('Navor/Nm');
legend('Tehnika A','Tehnika B' ,'Location','southeast') 
%}

A(floor(mojkont/kor+(1-st/kor)),1)=mojkont;
l=find(time>0.8,1);
j=find(M2(l:size(M2,1))<0.1,1);
A(floor(mojkont/kor+(1-st/kor)),2)=time(j+l);

end
A
toc
%}





 tic
close all;
static=5;
dinamic=0;


static_or_dinamic=dinamic;
 
parametriAM;
duration=1;
options=simset('FixedStep','1e-5','SrcWorkspace','base','DstWorkspace','base');
set_param('Model_IPS7', 'SolverName','FixedStepAuto');
sim('Model_IPS7', [0,duration],options);
start=find(time>0.65,1);
stop=find(time>0.99,1);

figure('Name','Idref','NumberTitle','off')
plot(time(start:stop),Idref1(start:stop))
hold on
plot(time(start:stop),Idref2(start:stop))
plot(time(start:stop),Idrefnemec(start:stop))
grid on
xlabel('cas/s');
ylabel('I_{dref}/A');
legend('A','B','standardna')


figure('Name','Id tehnike 2','NumberTitle','off')
plot(time(start:stop),Idref2(start:stop))
hold on
plot(time(start:stop),Id2(start:stop))

grid on
xlabel('cas/s');
ylabel('I_{d}/A');
legend('ref','dej')

figure('Name','Imr','NumberTitle','off')
plot(time(start:stop),Imrdej1(start:stop))
hold on
plot(time(start:stop),Imrdej2(start:stop))
plot(time(start:stop),Imrdejs(start:stop))
grid on
xlabel('cas/s');
ylabel('I_{mag}/A');
legend('Tehnika A','Tehnika B','Standardna')

figure('Name','Tokq','NumberTitle','off')
plot(time(start:stop),Iq1(start:stop,1))
hold on
plot(time(start:stop),Iq2(start:stop,1))
plot(time(start:stop),Iqs(start:stop,1))
grid on
xlabel('cas/s');
ylabel('Tokq/A');
legend('Tehnika A','Tehnika B','Standardna') 



figure('Name','Tokd','NumberTitle','off')
plot(time(start:stop),Id1(start:stop,1))
hold on
plot(time(start:stop),Id2(start:stop,1))
plot(time(start:stop),Ids(start:stop,1))
grid on
xlabel('cas/s');
ylabel('Tokd/A');
legend('Tehnika A','Tehnika B','Standardna') 
%end

figure('Name','vrtilna_hitrost','NumberTitle','off')
plot(time(start:stop),wdej1(start:stop)*30/pi)
hold on
plot(time(start:stop),wdej2(start:stop)*30/pi)
plot(time(start:stop),wdejs(start:stop)*30/pi)
grid on
xlabel('cas/s');
ylabel('obrati/rpm');
legend('Tehnika A','Tehnika B','Standardna','Location','southeast') 



figure('Name','navor','NumberTitle','off')
plot(time(start:stop),M1(start:stop))
hold on
plot(time(start:stop),M2(start:stop))
plot(time(start:stop),Ms(start:stop))
grid on
xlabel('cas/s');
ylabel('Navor/Nm');
legend('Tehnika A','Tehnika B','Standardna' ,'Location','southeast') 
cas1=time(find(wdej1>(4000*pi/30),1))
cas2=time(find(wdej2>(4000*pi/30),1))
cass=time(find(wdejs>(4000*pi/30),1))

toc

