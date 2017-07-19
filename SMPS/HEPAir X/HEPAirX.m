% plot and calculate all of the things for HEPAirX

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
AXCool1 = save_better('HEPAir X/Cool 1.csv', 75, plot_bool);
AXCool2 = save_better('HEPAir X/Cool 2.csv', 75, plot_bool);
AXHeat1 = save_better('HEPAir X/Heat1.csv', 75, plot_bool);

%Calculate air exchange rate
% AX_extime = [ft^3] / [ft^3 m^-1]; %time of a single room exchanges in minutes
AX_extime = 880/93;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
AXCool1_k = smps_k_vals(AXCool1, plot_k);
AXCool2_k = smps_k_vals(AXCool2, plot_k);
AXHeat1_k = smps_k_vals(AXHeat1, plot_k);
AX_kvals = [AXCool1_k(1,:); AXCool2_k(1,:); AXHeat1_k(1,:)];

theory_time = 0:.2:80;
AX = [0.180136667	0.006088237];
figure
hold on
plot(AXCool1(:,1),AXCool1(:,end)/AXCool1_k(1,2), 'kx');
plot(AXCool2(:,1),AXCool2(:,end)/AXCool2_k(1,2), 'k+');
plot(AXHeat1(:,1),AXHeat1(:,end)/AXHeat1_k(1,2), 'k*');
plot(theory_time+5, exp(-AX(1)*theory_time), 'k');
plot(theory_time+5, exp(-(AX(1)+AX(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(AX(1)-AX(2))*theory_time), 'k:');
axis([0 90 -.02 1])
title('HEPAirX');
xlabel('Time since extinguishing (minutes)');
ylabel('Normalized UFP concentration');
legend('Trial 1', 'Trial 2', 'Trial 3', strcat('Fit k=',num2str(AX(1),2),'\pm',num2str(AX(2),2)));
hold off

AX_ex = AX*AX_extime;
figure
hold on
plot(AXCool1(:,1)/AX_extime,AXCool1(:,end)/AXCool1_k(1,2), 'kx');
plot(AXCool2(:,1)/AX_extime,AXCool2(:,end)/AXCool2_k(1,2), 'k+');
plot(AXHeat1(:,1)/AX_extime,AXHeat1(:,end)/AXHeat1_k(1,2), 'k*');

plot((theory_time+5)/AX_extime, exp(-AX(1)*theory_time), 'k');
plot((theory_time+5)/AX_extime, exp(-(AX(1)+AX(2))*theory_time), 'k:');
plot((theory_time+5)/AX_extime, exp(-(AX(1)-AX(2))*theory_time), 'k:');
axis([0 20 -.02 1])
title('HEPAirX (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('Cool trial 1', 'Cool Trial 2', 'Heat trial 1', strcat('Fit k=',num2str(AX_ex(1),2),'\pm',num2str(AX_ex(2),2)));
hold off

theory_time = 0:.1:80;
Hteez = transpose(theory_time/AX_extime);
Hyeez = exp(-AX(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)

%Plot ufps of each trial over time with their k theoretical fits
% theory_time = 0:50;
% figure
% hold on
% plot(AXCool1(:,1),AXCool1(:,end), 'k');
% plot(AXCool2(:,1),AXCool2(:,end), 'b');
% plot(AXHeat1(:,1),AXHeat1(:,end), 'r');
% plot(theory_time+5, AXCool1_k(1,2)*exp(-AXCool1_k(1,1)*theory_time), 'k.')
% plot(theory_time+5, AXCool2_k(1,2)*exp(-AXCool2_k(1,1)*theory_time), 'b.')
% plot(theory_time+5, AXHeat1_k(1,2)*exp(-AXHeat1_k(1,1)*theory_time), 'r.')
% title('HEPAirX');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Concentration of UFP (#/cm^{3})');
% legend(strcat('cool1 k=',num2str(AXCool1_k(1))), strcat('cool2 k=',num2str(AXCool2_k(1))), strcat('heat1 k=',num2str(AXHeat1_k(1))));
% hold off

%plot the % reductions across each trial
% figure
% hold on
% plot(bins, AXCool1_k(2:end,3), 'k');
% plot(bins, AXCool2_k(2:end,3), 'b');
% plot(bins, AXHeat1_k(2:end,3), 'r');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of HEPAirX')
% legend('cool1', 'cool2', 'heat1');
% hold off