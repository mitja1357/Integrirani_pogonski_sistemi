
clear elementisimulacije;
casi=[4];

for i=1:max(size(casi))
    pomozna=find(ceil(time*1000)/1000==casi(i));
    elementisimulacije(i)= pomozna(max(size(pomozna)));
end

compleksentok=Idq1(elementisimulacije,1)+j*Iqmax1(elementisimulacije);
% figure
% compass(compleksentok)

xostok=zeros(2*max(size(compleksentok)),1);
yostok=zeros(2*max(size(compleksentok)),1);

for i=1:max(size(compleksentok))
    xostok(2*i)=real(compleksentok(i));
    yostok(2*i)=imag(compleksentok(i));
end
figure
plot(xostok,yostok)
grid on
axis equal
