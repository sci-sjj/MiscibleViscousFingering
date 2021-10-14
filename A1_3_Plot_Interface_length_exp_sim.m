clc
close all
clearvars
restoredefaultpath
addpath('Experimental_results')
addpath('Experimental_results/Literature_results/Interface_length')

colours =   [ 0,0,0; 0    0.4470    0.7410;0.8500    0.3250    0.0980;0.9290 ...
    0.6940    0.1250;0.4940    0.1840    0.5560; 0.4660    0.6740...
    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840; 0.5 0.5 0.5];

exp_pv_int_length = load('Exp_results_M_PVI_Interface_length.txt');
ld1 = importdata('chen_1997_pe_400.txt');
ld2 = importdata('chen_1997_pe_800.txt');
ld3 = importdata('chen_1997_pe_1200.txt');

pv = 45.43*1e-6;
h = 0.025e-2;
l = 400e-3;
l_pix = 1192.4;
Q = 1*1e-6/60;   %1 ml/min in m^3/s

t = (exp_pv_int_length(:,1)*pv/Q);
t_nd = t*Q/((l^2)*h);
lt = exp_pv_int_length(:,2:end)./l_pix;

t_nd_synth  = linspace(0.01, 5, 100);

msize= 8;
msize2= 8;

figure1 = figure('Position',[100 400 700 475]); 
hold on

plot(ld1(:,1),ld1(:,2), 'ko-','linewidth', 2,'markersize',msize2 )  
plot(ld2(:,1),ld2(:,2), 'kx-','linewidth', 2,'markersize',msize2 )  
plot(ld3(:,1),ld3(:,2), 'ks-','linewidth', 2,'markersize',msize2 )  


plot(t_nd, lt(:,1), 'o-','color',colours (3,:),'linewidth', 2,'markersize',msize )  
plot(t_nd, lt(:,2), 'x--','color',colours (3,:),'linewidth', 2,'markerfacecolor',colours (3,:),'markersize',msize )  
plot(t_nd, lt(:,3), 's-.','color',colours (3,:),'linewidth', 2,'markersize',msize )  
plot(t_nd, lt(:,4), '^-','color',colours (3,:),'linewidth', 2,'markerfacecolor',colours (3,:),'markersize',msize )  
plot(t_nd, lt(:,5), '+--','color',colours (3,:),'linewidth', 2,'markerfacecolor',colours (3,:),'markersize',msize )  



plot(t_nd_synth, sqrt(t_nd_synth)*2.5, 'k--','linewidth', 1,'markerfacecolor','k','markersize',msize )  

set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlim([0.01 5])
ylim([0.3 10])


legend(['Chen \& Meiburg (1998)' char(10) '$P_e$ = 255, $M = 12$'], ...
    ['Chen \& Meiburg (1998)' char(10) '$P_e$ = 510, $M = 12$'], ...
    ['Chen \& Meiburg (1998)' char(10) '$P_e$ = 765, $M = 12$'],...
    'This work, $M=1$', 'This work, $M=2$', 'This work, $M=5$', 'This work, $M=10$', 'This work, $M=20$', 'location', 'SouthEast', 'interpreter', 'latex', 'fontsize', 15)

xlabel('Time, $t^* = t \cdot \left( \frac{Q}{L^2 h} \right)$ [-]', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Interface length, $l^* = l/L$ [-]', 'Interpreter', 'Latex', 'fontsize', 20)
set(gca,'TickLabelInterpreter','latex')


annotation(figure1,'textarrow',[0.255 0.29],...
    [0.381052631578947 0.263157894736842],'String',{'$l^* \propto \sqrt{t^*}$'},...
    'Interpreter','latex',...
    'FontSize',20);


grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)

