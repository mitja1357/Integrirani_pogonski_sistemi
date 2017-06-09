%%%poisci case
close all
clear casna5tisoc
clear xosi
clear yos
clear yosi
clear xos
clear arrayA
clear arrayB
i=1;
a=a1;
b=b1;
wn=2200;
zeljenehitrosti=[floor(wn*30/pi),6000,7000];



for i=1:max(size(zeljenehitrosti))
    
    pomozna1=find(floor(w1.*(pp*60/2/pi))==zeljenehitrosti(i))
    
    casna5tisoc(i)= pomozna1(1);
    i=i+1;
end

%%poisci a in b

for i=1:size(casna5tisoc,2)
    arrayA(i)=a(casna5tisoc(i));
    arrayB(i)=b(casna5tisoc(i));
    i=i+1;
end
%doloci zgornjo polovico elipse
for i=1:size(arrayA,2)
    xos=linspace(-arrayA(i),arrayA(i),1000);
    xosi(:,i)=xos;
    yos=arrayB(i)*sqrt(1-(xos./arrayA(i)).^2);
    yosi(:,i)=yos;
end
tokovna=linspace(-Ismax,Ismax,1000);
toky=sqrt(Ismax^2-tokovna.^2);
plot(xosi,yosi)
hold on

plot(tokovna, toky)

grid on
axis equal
legend({'napetostna 4000rpm','napetostna 6000rpm','napetostna 8000rpm','tokovna'})
plot(xosi,-yosi)
plot(tokovna, -toky)
%plot( [0 10.4644 0 10.4651 0 8.8838 0 6.4487], [0 14.5966 0 14.5966 0 15.6096 0 16.7629])



