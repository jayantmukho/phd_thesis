clear all;
close all;
clc;
set(groot,'defaultAxesFontSize',18)
set(groot,'defaultAxesTickLength',[0.01 0.01])
set(groot,'defaultAxesLineWidth',2)


fs = 18;
lw = 3.0;

load('data_CFR147d_initial_example.mat');
plot_options = plotting_options('thesis');
plot_options.width = 8;
plot_options.height = 5;
plot_options.font_size = fs;
plot_options.line_width = lw;
setup_plots(plot_options);

%% Plot the nominal trajectories for the original requirement
%   Plot the original requirement of 11 seconds

% Roll Angle
figure(1); clf; hold on;
plot(phi_rad_struct(1).time,phi_rad_struct(1).values*180/pi,'k');
xlabel('Time (sec)');
ylabel('Roll Angle $(^\circ)$');
grid on; box on;
saveas(gcf,'images/cfr147d_roll_angle.png')

% Roll Acceleration
figure(2); clf; hold on; set_figure_size(gcf,8,5);
plot(pdot_dps2_struct_CPR(1).time,pdot_dps2_struct_CPR(1).values,'k');
xlabel('Time (sec)');
ylabel('Roll Acceleration $(^\circ/s^2)$');
ylim([-8,8])
grid on; box on;
saveas(gcf,'images/cfr147d_roll_acc.png')

% Aileron Deflection
figure(3); clf; set_figure_size(gcf,8,5);
subplot(2,1,1); hold on;
plot(surf_AIL_deg_struct(1).time-2,surf_AIL_deg_struct(1).values,'k');
xlim([0 max(surf_AIL_deg_struct(1).time)-2]);
xlabel('Time (sec)');
ylabel('L. Aileron $(^\circ)$');
ylim([-10,10])
grid on; box on;

subplot(2,1,2); hold on;
plot(surf_AIR_deg_struct(1).time-2,surf_AIR_deg_struct(1).values,'k');
xlim([0 max(surf_AIR_deg_struct(1).time)-2]);
set(gca,'FontSize',fs);
xlabel('Time (sec)');
ylabel('R. Aileron $(^\circ)$');
ylim([-10,10])
grid on; box on;
saveas(gcf,'images/cfr147d_ail_defl.png')

%%
% Yaw Acceleration
figure(4); clf; hold on; 
plot(rdot_dps2_struct_CPA(1).time-2,rdot_dps2_struct_CPA(1).values,'k');
xlim([0 max(rdot_dps2_struct_CPA(1).time)-2]);
xlabel('Time (sec)');
ylabel('Yaw Acceleration $(^\circ/s^2)$');
grid on; box on;
saveas(gcf,'images/cfr147d_yaw_acc.png')

% Rudder Deflection
figure(5); clf; hold on; 
% set(gcf,'Position',[589,456,755,420]); 
plot(surf_RUD_deg_struct(1).time-2,surf_RUD_deg_struct(1).values,'k');
xlim([0 max(surf_RUD_deg_struct(1).time)-2]);
xlabel('Time (sec)');
ylabel('Rudder $(^\circ)$');
grid on; box on;
saveas(gcf,'images/cfr147d_rud_defl.png')

% Pitch Acceleration
figure(6); clf; hold on; 
% set(gcf,'Position',[589,456,755,420]); 
plot(qdot_dps2_struct_CPA(1).time-2,qdot_dps2_struct_CPA(1).values,'k');
xlim([0 max(qdot_dps2_struct_CPA(1).time)-2]);
xlabel('Time (sec)');
ylabel('Pitch Acceleration $(^\circ/s^2)$');
grid on; box on;
saveas(gcf,'images/cfr147d_pitch_acc.png')

% Elevator Deflection
figure(7); clf; hold on; 
% set(gcf,'Position',[589,456,755,420]); 
plot(surf_ELV_deg_struct(1).time-2,surf_ELV_deg_struct(1).values,'k');
xlim([0 max(surf_ELV_deg_struct(1).time)-2]);
xlabel('Time (sec)');
ylabel('Elevator $(^\circ)$');
grid on; box on;
saveas(gcf,'images/cfr147d_elev_defl.png')

%% Now look at engine-out analyses

% Roll Acceleration
figure(8); clf; hold on; 
plot(pdot_dps2_struct_CPA(1).time-2,pdot_dps2_struct_CPA(1).values);
plot(pdot_dps2_struct_CPA(2).time-2,pdot_dps2_struct_CPA(2).values);
plot(pdot_dps2_struct_CPA(3).time-2,pdot_dps2_struct_CPA(3).values);
xlim([0 max(pdot_dps2_struct_CPA(1).time)-2]);
xlabel('Time (sec)');
ylabel('Roll Acceleration $(^\circ/s^2)$');
legend('Normal','R. Engine Out','L. Engine Out','Location','best');
grid on; box on;
saveas(gcf,'images/eo_cfr147d_roll_acc.png')

% Yaw Acceleration
figure(9); clf; hold on; 
plot(rdot_dps2_struct_CPA(1).time-2,rdot_dps2_struct_CPA(1).values);
plot(rdot_dps2_struct_CPA(2).time-2,rdot_dps2_struct_CPA(2).values);
plot(rdot_dps2_struct_CPA(3).time-2,rdot_dps2_struct_CPA(3).values);
xlim([0 max(rdot_dps2_struct_CPA(1).time)-2]);
xlabel('Time (sec)');
ylabel('Yaw Acceleration $(^\circ/s^2)$');
grid on; box on;
saveas(gcf,'images/eo_cfr147d_yaw_acc.png')

% Pitch Acceleration
figure(10); clf; hold on; 
plot(qdot_dps2_struct_CPA(1).time-2,qdot_dps2_struct_CPA(1).values);
plot(qdot_dps2_struct_CPA(2).time-2,qdot_dps2_struct_CPA(2).values);
plot(qdot_dps2_struct_CPA(3).time-2,qdot_dps2_struct_CPA(3).values);
xlim([0 max(rdot_dps2_struct_CPA(1).time)-2]);
set(gca,'FontSize',fs);
xlabel('Time (sec)');
ylabel('Pitch Acceleration $(^\circ/s^2)$');
grid on; box on;
saveas(gcf,'images/eo_cfr147d_pitch_acc.png')

% Aileron Deflection
figure(11); clf;
subplot(2,1,1); hold on;
plot(surf_AIL_deg_struct(1).time-2,surf_AIL_deg_struct(1).values);
plot(surf_AIL_deg_struct(2).time-2,surf_AIL_deg_struct(2).values);
plot(surf_AIL_deg_struct(3).time-2,surf_AIL_deg_struct(3).values);
xlim([0 max(surf_AIL_deg_struct(1).time)-2]);
xlabel('Time (sec)');
ylabel('L. Aileron $(^\circ)$');
grid on; box on;
% legend('Normal','R. Engine Out','L. Engine Out','Location','Best');
subplot(2,1,2); hold on;
plot(surf_AIR_deg_struct(1).time-2,surf_AIR_deg_struct(1).values);
plot(surf_AIR_deg_struct(2).time-2,surf_AIR_deg_struct(2).values);
plot(surf_AIR_deg_struct(3).time-2,surf_AIR_deg_struct(3).values);
xlim([0 max(surf_AIR_deg_struct(1).time)-2]);
xlabel('Time (sec)');
ylabel('R. Aileron $(^\circ)$');
grid on; box on;
saveas(gcf,'images/eo_cfr147d_ail_defl.png')

% Rudder Deflection
figure(12); clf; hold on; 
plot(surf_RUD_deg_struct(1).time-2,surf_RUD_deg_struct(1).values);
plot(surf_RUD_deg_struct(2).time-2,surf_RUD_deg_struct(2).values);
plot(surf_RUD_deg_struct(3).time-2,surf_RUD_deg_struct(3).values);
xlim([0 max(surf_RUD_deg_struct(1).time)-2]);
set(gca,'FontSize',fs);
xlabel('Time (sec)');
ylabel('Rudder $(^\circ)$');
grid on; box on;
saveas(gcf,'images/eo_cfr147d_rud_defl.png')

% Elevator Deflection
figure(13); clf; hold on; 
plot(surf_ELV_deg_struct(1).time-2,surf_ELV_deg_struct(1).values);
plot(surf_ELV_deg_struct(2).time-2,surf_ELV_deg_struct(2).values);
plot(surf_ELV_deg_struct(3).time-2,surf_ELV_deg_struct(3).values);
xlim([0 max(surf_ELV_deg_struct(1).time)-2]);
xlabel('Time (sec)');
ylabel('Elevator $(^\circ)$');
grid on; box on;
saveas(gcf,'images/eo_cfr147d_elev_defl.png')

%% Plot mean response
load('./Stanford_CFR25_147d/WT_trajectory_results')
figure(14); clf; hold on;
% set(gcf,'Position',[589,456,755,420]);
i=1;
plot(CPR_traj_mean(4).normal.phi_rad.time,CPR_traj_mean(4).normal.phi_rad.values*180/pi,'k');
plot(CPR_traj_MC(4).normal(i).phi_rad.time,CPR_traj_MC(4).normal(i).phi_rad.values*180/pi,'color','#8C1515');
xlabel('Time (sec)');
ylabel('Roll Angle $(^\circ)$');
legend('Target','Actual');
grid on; box on;
saveas(gcf,'images/cfr147d_roll_angle_mean.png')

