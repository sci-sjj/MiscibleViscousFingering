clc
close all
clearvars
restoredefaultpath

colours =   [ 0,0,0; 0    0.4470    0.7410;0.8500    0.3250    0.0980;0.9290 ...
    0.6940    0.1250;0.4940    0.1840    0.5560; 0.4660    0.6740...
    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840; 0.5 0.5 0.5];


addpath('Experimental_results')
addpath('Experimental_results/Literature_results/Recovery_mobility_ratio')

exp_data = importdata('Exp_results_all_BT_REC_M_PE.txt');

ld1 = importdata('chen_1997.txt');
ld2 = importdata('Lacey_1961.txt');
ld3 = importdata('djabbarov_2014.txt');
ld4 = importdata('Haberman_1960_area.txt');
ld5 = importdata('Haberman_1960_volume.txt');
ld6 = importdata('Mahafrey_1966.txt');
ld7 = importdata('petitjeans_1999.txt');
ld8 = importdata('zhang_1996.txt');

msize = 15;
msize2 = 10;


figure('Position',[100 400 700 475]); 
hold on

plot(ld4(:,1),ld4(:,2)/100, 'k-','linewidth', 2)
plot(ld5(:,1),ld5(:,2)/100, 'k--','linewidth', 2)
plot(ld2(:,1),ld2(:,2)/100, 'k<','linewidth',  1,'markersize', msize)
plot(ld6(:,1),ld6(:,2)/100, 'k+','linewidth', 1,'markersize', msize)

plot(ld8(:,1),ld8(:,2)/100, 'kd','linewidth', 1,'markersize', msize)
plot(ld7(:,1),ld7(:,2)/100, 'k^','linewidth', 1,'markersize', msize)
plot(ld3(:,1),ld3(:,2)/100, 'k*','linewidth', 1,'markersize', msize)


plot(exp_data.data(1:8,1),exp_data.data(1:8,4), 'o','color',colours (2,:), 'markersize', msize2, 'markerfacecolor',colours (2,:))
errorbar(exp_data.data(1:8,1),exp_data.data(1:8,5),exp_data.data(1:8,8), 's','color',colours (3,:), 'markersize', msize2, 'markerfacecolor',colours (3,:))


xlim([0 25])
ylim([0.2 0.9])

legend('Habermann (1960) area based','Habermann (1960) volume based',...
    'Lacey, Faris \& Brinkman (1961)', ...
    'Mahaffey, Rutherford \& Matthews (1966)', ...
    'Zhang $et$ $al.$ (1996)',...
    'Petitjeans $et$ $al.$ (1999)',...%'Chen \& Meiburg (1997)',...
    'Djabbarov $et$ $al.$ (2014)',...
    'This work, image based','This work, volume based', 'location', 'NorthEast', 'interpreter', 'latex', 'fontsize', 16)
xlabel('Viscosity ratio, $M$ [-]', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Breakthrough time, $t_b$ [PV]', 'Interpreter', 'Latex', 'fontsize', 20)
set(gca,'TickLabelInterpreter','latex')
grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)

