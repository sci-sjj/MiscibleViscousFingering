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
Sim_results_Pe_BT_REC_mol = load('Sim_results_Pe_BT01_BT03_BT05_REC_mol_diff_only.txt');
Sim_results_Pe_BT_REC_para = load('Sim_results_Pe_BT01_BT03_BT05_REC_para.txt');

pe_sim = [14000, 70000, 140000, 700000];
pe_ind = [9;10;6;7;8;11;12];

av_ind_Pe = {9; 10; [6;7;8];11;12};
av_bt_Pe = zeros(5,2);
av_rec_Pe = zeros(5,2);

msize2 = 10;
msize2_small = 4;

for i = 1:5
    av_bt_Pe(i,1) = nanmean(nanmean(exp_data.data(av_ind_Pe{i}, 3), 2));
    av_bt_Pe(i,2) = nanmean(nanmean(exp_data.data(av_ind_Pe{i}, 4:5), 2));

    av_rec_Pe(i,1) = nanmean(nanmean(exp_data.data(av_ind_Pe{i}, 3), 2));
    av_rec_Pe(i,2) = nanmean(nanmean(exp_data.data(av_ind_Pe{i}, 7), 2));
end

figure
hold on

plot(exp_data.data(pe_ind,3),exp_data.data(pe_ind,4), 'o','color',colours (2,:), 'markersize', msize2, 'linewidth', 1.5)
errorbar(exp_data.data(pe_ind,3),exp_data.data(pe_ind,5),exp_data.data(pe_ind,8), 's','color',colours (3,:), 'markersize', msize2, 'linewidth', 1.5)
plot(av_bt_Pe(:,1), av_bt_Pe(:,2), 'k-','linewidth', 2)

errorbar(pe_sim, Sim_results_Pe_BT_REC_para(:,3),...
    Sim_results_Pe_BT_REC_para(:,4)-Sim_results_Pe_BT_REC_para(:,3),...
    Sim_results_Pe_BT_REC_para(:,3) - Sim_results_Pe_BT_REC_para(:,2), '^','color',colours(5,:),'markerfacecolor',colours(5,:),'markersize', msize2)

errorbar(pe_sim, Sim_results_Pe_BT_REC_mol(:,3),...
    Sim_results_Pe_BT_REC_mol(:,4)-Sim_results_Pe_BT_REC_mol(:,3),...
    Sim_results_Pe_BT_REC_mol(:,3) - Sim_results_Pe_BT_REC_mol(:,2), '>','color',colours(6,:),'markerfacecolor',colours(6,:),'markersize', msize2)

xlim([1e4 2e6])
ylim([0.15 0.55])

legend('Experiment, image based', 'Experiment, volume based','Experiment average', 'Simulation, parallel mesh, $\textit{\bfseries{D}}$','Simulation, parallel mesh, $D_m$','interpreter', 'latex', 'fontsize', 18, 'location', 'NorthWest')
xlabel('Peclet number, $Pe$ [-]', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Breakthrough time, $t_b$ [$PV$]', 'Interpreter', 'Latex', 'fontsize', 20)

set(gca,'TickLabelInterpreter','latex')
set(gca, 'XScale', 'log')
grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)


figure
hold on

errorbar(exp_data.data(pe_ind,3),exp_data.data(pe_ind,7),exp_data.data(pe_ind,8), 's','color',colours (3,:), 'markersize', msize2, 'linewidth', 1.5)

plot(av_rec_Pe(:,1), av_rec_Pe(:,2), 'k-','linewidth', 2)
plot(pe_sim, Sim_results_Pe_BT_REC_para(:,5),'^','color',colours(5,:),'markerfacecolor',colours(5,:),'markersize', msize2)
plot(pe_sim, Sim_results_Pe_BT_REC_mol(:,5),'>','color',colours(6,:),'markerfacecolor',colours(6,:),'markersize', msize2)

xlim([1e4 2e6])
ylim([0.3 0.9])

legend('Experiment, volume based','Experiment average', 'Simulation, parallel mesh, $\textit{\bfseries{D}}$','Simulation, parallel mesh, $D_m$','interpreter', 'latex', 'fontsize', 18, 'location', 'NorthWest')
xlabel('Peclet number, $Pe$ [-]', 'Interpreter', 'Latex', 'fontsize', 20)
ylabel('Recovery at 1 PVI, [$PV$]', 'Interpreter', 'Latex', 'fontsize', 20)

set(gca,'TickLabelInterpreter','latex')
set(gca, 'XScale', 'log')
grid on
set(gcf,'color','w');
set(gca,'Fontsize',20)

