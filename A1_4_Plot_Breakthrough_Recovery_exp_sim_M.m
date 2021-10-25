clc
close all
clearvars
restoredefaultpath
addpath('Simulation_results')
addpath('Experimental_results/txt_results')

colours =   [ 0,0,0; 0    0.4470    0.7410;0.8500    0.3250    0.0980;0.9290 ...
    0.6940    0.1250;0.4940    0.1840    0.5560; 0.4660    0.6740...
    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840; 0.5 0.5 0.5];

exp_data = importdata('Exp_results_all_BT_REC_M_PE.txt');

sim_results_M_Bt_diag = load('Sim_results_M_BT01_BT03_BT05_REC_diag.txt');
sim_results_M_Bt_para = load('Sim_results_M_BT01_BT03_BT05_REC_para.txt');
sim_results_M_Bt_para_reals = load('Sim_results_M_BT01_BT03_BT05_REC_para_reals.txt');

m_ind = 1:8;

av_ind_M = {1; [2;3]; [4;5];[6;7;8] };
av_bt_M = zeros(4,2);
av_rec_M  = zeros(4,2);

for i = 1:4
    av_bt_M(i,1) = nanmean(nanmean(exp_data.data(av_ind_M{i}, 1), 2));
    av_bt_M(i,2) = nanmean(nanmean(exp_data.data(av_ind_M{i}, 4:5), 2));

    av_rec_M(i,1) = nanmean(nanmean(exp_data.data(av_ind_M{i}, 1), 2));
    av_rec_M(i,2) = nanmean(nanmean(exp_data.data(av_ind_M{i}, 7), 2));
end



msize2 = 10;
msize2_small = 4;
figure
hold on

errorbar(exp_data.data(m_ind,1),exp_data.data(m_ind,4),exp_data.data(m_ind,1)*0.1, 'horizontal', 'o','color',colours (2,:), 'markersize', msize2, 'linewidth', 1.5)
errorbar(exp_data.data(m_ind,1),exp_data.data(m_ind,5),exp_data.data(m_ind,8),exp_data.data(m_ind,8), exp_data.data(m_ind,1)*0.1, exp_data.data(m_ind,1)*0.1, 's','color',colours (3,:), 'markersize', msize2, 'linewidth', 1.5)

%errorbar(exp_data.data(m_ind,1),exp_data.data(m_ind,7),exp_data.data(m_ind,8), 's','color',colours (2,:), 'markersize', msize2)

plot(av_bt_M(:,1), av_bt_M(:,2), 'k-','linewidth', 2)

errorbar(sim_results_M_Bt_diag(:,1), sim_results_M_Bt_diag(:,3),...
    sim_results_M_Bt_diag(:,3)-sim_results_M_Bt_diag(:,2),...
    sim_results_M_Bt_diag(:,4)-sim_results_M_Bt_diag(:,3), 'd','color',colours(4,:), 'markerfacecolor',colours(4,:),'markersize', msize2 , 'linewidth', 1.5)

errorbar(sim_results_M_Bt_para(:,1), sim_results_M_Bt_para(:,3),...
    sim_results_M_Bt_para(:,3)-sim_results_M_Bt_para(:,2),...
    sim_results_M_Bt_para(:,4)-sim_results_M_Bt_para(:,3), '^','color',colours(5,:), 'markerfacecolor',colours(5,:),'markersize',msize2, 'linewidth', 1.5 )

plot(sim_results_M_Bt_para_reals(:,1), sim_results_M_Bt_para_reals(:,3), '^','color',colours(5,:), 'markerfacecolor',colours(5,:),'markersize',msize2_small)

%plot(ones(4)*20,sim_reals, 'r^','markerfacecolor','r','markersize',4 )  

xlim([0 25])
ylim([0.2 0.7])

legend('Experiment, image based','Experiment, volume based','Experiment average','Simulation, diagonal mesh','Simulation, parallel mesh', 'interpreter', 'latex', 'fontsize', 18)
xlabel('Viscosity ratio, $M$', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Breakthrough time, $t_b$ [$PV$]', 'Interpreter', 'Latex', 'fontsize', 20)
set(gca,'TickLabelInterpreter','latex')
grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)


figure
hold on

errorbar(exp_data.data(m_ind,1),exp_data.data(m_ind,7),exp_data.data(m_ind,8),exp_data.data(m_ind,8),exp_data.data(m_ind,1)*0.1, exp_data.data(m_ind,1)*0.1,  's','color',colours (3,:), 'markersize', msize2, 'linewidth', 1.5)


plot(av_rec_M(:,1), av_rec_M(:,2), 'k-','linewidth', 2)

plot(sim_results_M_Bt_diag(:,1), sim_results_M_Bt_diag(:,5), 'd','color',colours(4,:),'markerfacecolor',colours(4,:),'markersize', msize2)
plot(sim_results_M_Bt_para(:,1), sim_results_M_Bt_para(:,5), '^','color',colours(5,:),'markerfacecolor',colours(5,:),'markersize', msize2)
plot(sim_results_M_Bt_para_reals(:,1), sim_results_M_Bt_para_reals(:,5), '^','color',colours(5,:),'markerfacecolor',colours(5,:),'markersize', msize2_small)

xlim([0 25])
ylim([0.4 0.9])

legend('Experiment, volume based','Experiment average','Simulation, diagonal mesh','Simulation, parallel mesh', 'interpreter', 'latex', 'fontsize', 18)
xlabel('Viscosity ratio, $M$', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Recovery at 1 $PVI$, [$PV$]', 'Interpreter', 'Latex', 'fontsize', 20)
set(gca,'TickLabelInterpreter','latex')
grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)
