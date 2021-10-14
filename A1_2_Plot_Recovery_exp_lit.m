clc
close all
clearvars

addpath('Experimental_results')
addpath('Experimental_results/Literature_results/pvi_pvp')


colours =   [ 0,0,0; 0    0.4470    0.7410;0.8500    0.3250    0.0980;0.9290 ...
    0.6940    0.1250;0.4940    0.1840    0.5560; 0.4660    0.6740...
    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840; 0.5 0.5 0.5];



exp_M10_pvi_pvp = load('Exp_result_M10_PVI_PVP.txt');
ld1 = load('djabbarov_2014.txt');
ld3 = load('Lacey_1961.txt');
ld4 = load('Mahafrey_1966_0_0015in.txt');
ld5 = load('Mahafrey_1966_0_0047in.txt');


figure('Position',[100 400 700 475]); 
hold on

plot(ld1(:,1),ld1(:,2), 'k-','linewidth', 1)
plot(ld3(:,1),ld3(:,2), 'k--','linewidth', 3)
plot(ld4(:,1),ld4(:,2), 'k-','linewidth', 3)
plot(ld5(:,1),ld5(:,2), 'k-.','linewidth', 3)

plot(exp_M10_pvi_pvp(:,1),exp_M10_pvi_pvp(:,2), '-','color',colours (3,:), 'linewidth', 3)


%plot(ones(4)*20,sim_reals, 'r^','markerfacecolor','r','markersize',4 )  

xlim([0 1.6])
ylim([0 1])

legend('Djabbarov $et$ $al.$ (2014)','Lacey, Faris \& Brinkman (1961)', ...
    'Mahaffey, Rutherford \& Matthews (1966) 0.0015in', ...
    'Mahaffey, Rutherford \& Matthews (1966) 0.0047in',...
    'This work, volume based', 'location', 'NorthWest', 'interpreter', 'latex', 'fontsize', 16)
xlabel('Pore-volumes injected [$PV$]', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Pore-volumes produced [$PV$]', 'Interpreter', 'Latex', 'fontsize', 20)
set(gca,'TickLabelInterpreter','latex')
grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)

