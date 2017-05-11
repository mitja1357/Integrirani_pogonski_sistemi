close all;
k=60/2/pi;


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% dinamika %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

duration=1.45;
options=simset('FixedStep','1e-5','SrcWorkspace','base','DstWorkspace','base');
%set_param('dq_model', 'SolverName','VariableStepAuto');
sim('dq_model', [0,duration],options);


figure('Name','vrtilna','NumberTitle','off')
%plot(time,w_fdb_s*k)
hold on
plot(time,w_fdb_A*k)
plot(time,w_fdb_B*k)
plot(time,w_ref*k)
grid on
xlabel('čas / s');
ylabel('vrtilna hitrost / obrati min^{-1}');
legend('Tehnika A','Tehnika B','Referenca','Location','southeast')

figure('Name','Imr','NumberTitle','off')
%plot(time,I_mr_s)
hold on
plot(time,I_mr_A)
plot(time,I_mr_B)
grid on
xlabel('čas / s');
ylabel('I_{mr} / A');
legend('Tehnika A','Tehnika B','Location','southeast')


figure('Name','Navor','NumberTitle','off')
%plot(time,M_el_s)
hold on
plot(time,M_el_A)
plot(time,M_el_B)
% plot(time,M_el_s)
grid on
xlabel('čas / s');
ylabel('M_{el} / Nm');
legend('Tehnika A','Tehnika B','Location','northeast')

figure('Name','Navormax','NumberTitle','off')
%plot(time,M_max_s)
hold on
plot(time,M_max_A)
plot(time,M_max_B)
% plot(time,M_max_s)
grid on
xlabel('čas / s');
ylabel('M_{el max} / Nm');
legend('Tehnika A','Tehnika B','Location','southeast')

figure('Name','Imref','NumberTitle','off')
%plot(time,I_mr_s)
hold on
plot(time,I_mr_Aref)
plot(time,I_mr_Bref)
grid on
xlabel('čas / s');
ylabel('I_{mr} / A');
legend('Tehnika A','Tehnika B','Location','southeast')


%{
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% statika %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
duration=50;
options=simset('FixedStep','1e-5','SrcWorkspace','base','DstWorkspace','base');
set_param('dq_model', 'SolverName','VariableStepAuto');
sim('dq_model', [0,duration],options);
st=find(w_fdb_A>0,1);
stop=find(w_fdb_A>6000*2*pi/60,1);
figure('Name','Imr','NumberTitle','off')
%plot(w_fdb_s*k,I_mr_s)
hold on
plot(w_fdb_A(st:stop)*k,I_mr_A(st:stop))
plot(w_fdb_B(st:stop)*k,I_mr_B(st:stop))
grid on
xlabel('vrtilna hitrost / obrati min^{-1}');
ylabel('I_{mr} / A');
legend('Tehnika A','Tehnika B','Location','northeast')


figure('Name','Imrref','NumberTitle','off')
%plot(w_fdb_s*k,I_mr_s)
hold on
plot(w_fdb_A(st:stop)*k,I_mr_Aref(st:stop))
plot(w_fdb_B(st:stop)*k,I_mr_Bref(st:stop))
grid on
xlabel('vrtilna hitrost / obrati min^{-1}');
ylabel('I_{sd}^* / A');
legend('Tehnika A','Tehnika B','Location','northeast')

figure('Name','Navor','NumberTitle','off')
%plot(time,M_el_s)
hold on
plot(time,M_el_A)
plot(time,M_el_B)
grid on
xlabel('cas / s');
ylabel('M_{el} / Nm');
legend('Tehnika A','Tehnika B','Location','northeast')

figure('Name','Navormax','NumberTitle','off')
%plot(time,M_max_s)
hold on
plot(time,M_max_A)
plot(time,M_max_B)
grid on
xlabel('cas / s');
ylabel('M_{el max} / Nm');
legend('Tehnika A','Tehnika B','Location','southeast')

figure('Name','napetost','NumberTitle','off')
%plot(time,w_fdb_s*k)
hold on
plot(w_fdb_A(st:end)*k,u_A(st:end))
plot(w_fdb_B(st:end)*k,u_B(st:end))
grid on
xlabel('cas / s');
ylabel('napetost /V');
legend('Tehnika A','Tehnika B','Location','southeast')

pomoc=M_max_A./I_mr_A/Lm^2*Lr/pp/1.5;


abstokA=sqrt(Idq_A(:,1).^2+pomoc.^2);
abstokB=sqrt(Idq_B(:,1).^2+Idq_B(:,2).^2);
abstoks=sqrt(Idq_s(:,1).^2+Idq_s(:,2).^2);
figure('Name','napetost','NumberTitle','off')
%plot(time,w_fdb_s*k)
hold on
plot(w_fdb_A(st:end)*k,abstokA(st:end))
plot(w_fdb_B(st:end)*k,abstokA(st:end))
grid on
xlabel('cas / s');
ylabel('napetost /V');
legend('Tehnika A','Tehnika B','Location','southeast')
%}