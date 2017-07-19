% plot all of the things for Sham

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
SHHigh1 = save_better('Sham!/High 1.csv', 70, plot_bool);
SHHigh2 = save_better('Sham!/High 2.csv', 70, plot_bool);
SHLow1 = save_better('Sham!/Low 1.csv', 70, plot_bool);
SHLow2 = save_better('Sham!/Low 2.csv', 70, plot_bool);

SHHigh_extime = 880/241;
SHLow_extime = 880/73.6;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
SHHigh1_k = smps_k_vals(SHHigh1, plot_k);
SHHigh2_k = smps_k_vals(SHHigh2, plot_k);
SHLow1_k = smps_k_vals(SHLow1, plot_k);
SHLow2_k = smps_k_vals(SHLow2, plot_k);
SH_kvals = [SHHigh1_k(1,:); SHHigh2_k(1,:); SHLow1_k(1,:); SHLow2_k(1,:)];
SHHigh_r2 = mean(SH_kvals(1:2,4));
SHLow_r2 = mean(SH_kvals(3:4,4));
theory_time = 0:.1:80;
SHHigh = [0.012854	0.002702562];
SHLow = [0.0073131	0.000193606];
figure
hold on
plot(SHHigh1(:,1),SHHigh1(:,end)/SHHigh1_k(1,2), 'kx');
plot(SHHigh2(:,1)-1,SHHigh2(:,end)/SHHigh2_k(1,2), 'k+');
plot(theory_time+5, exp(-SHHigh(1)*theory_time), 'k');
plot(SHLow1(:,1)-2,SHLow1(:,end)/SHLow1_k(1,2), 'rx');
plot(SHLow2(:,1)-1,SHLow2(:,end)/SHLow2_k(1,2), 'r+');
plot(theory_time+5, exp(-SHLow(1)*theory_time), 'r');

plot(theory_time+5, exp(-(SHHigh(1)+SHHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(SHHigh(1)-SHHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(SHLow(1)+SHLow(2))*theory_time), 'r:');
plot(theory_time+5, exp(-(SHLow(1)-SHLow(2))*theory_time), 'r:');
axis([0 90 -.02 1])
title('Sham');
xlabel('Time since extinguishing (minutes)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(SHHigh(1),2),'\pm',num2str(SHHigh(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(SHLow(1),2),'\pm',num2str(SHLow(2),2)));
hold off

SHHigh_ex = SHHigh*SHHigh_extime;
SHLow_ex = SHHigh*SHLow_extime;
figure
hold on
plot(SHHigh1(:,1)/SHHigh_extime,SHHigh1(:,end)/SHHigh1_k(1,2), 'kx');
plot(SHHigh2(:,1)/SHHigh_extime,SHHigh2(:,end)/SHHigh2_k(1,2), 'k+');
plot((theory_time+5)/SHHigh_extime, exp(-SHHigh(1)*theory_time), 'k');
plot(SHLow1(:,1)/SHLow_extime,SHLow1(:,end)/SHLow1_k(1,2), 'rx');
plot(SHLow2(:,1)/SHLow_extime,SHLow2(:,end)/SHLow2_k(1,2), 'r+');
plot((theory_time+5)/SHLow_extime, exp(-SHLow(1)*theory_time), 'r')

plot((theory_time+5)/SHHigh_extime, exp(-(SHHigh(1)+SHHigh(2))*theory_time), 'k:');
plot((theory_time+5)/SHHigh_extime, exp(-(SHHigh(1)-SHHigh(2))*theory_time), 'k:');
plot((theory_time+5)/SHLow_extime, exp(-(SHLow(1)+SHLow(2))*theory_time), 'r:');
plot((theory_time+5)/SHLow_extime, exp(-(SHLow(1)-SHLow(2))*theory_time), 'r:');
axis([0 20 -.02 1])
title('Sham (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(SHHigh_ex(1),2),'\pm',num2str(SHHigh_ex(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(SHLow_ex(1),2),'\pm',num2str(SHLow_ex(2),2)));
hold off

theory_time = 0:.1:80;
Hteez = transpose(theory_time/SHHigh_extime);
Hyeez = exp(-SHHigh(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)
Lteez = transpose(theory_time/SHLow_extime);
Lyeez = exp(-SHLow(1)*theory_time);
ell = Lyeez(Lteez>0.99);
1-ell(1)

%Plot ufps of each trial over time with their k theoretical fits
% theory_time = 0:50;
% figure
% hold on
% plot(SHHigh1(:,1),SHHigh1(:,end), 'k');
% plot(SHHigh2(:,1),SHHigh2(:,end), 'b');
% plot(SHLow1(:,1),SHLow1(:,end), 'r');
% plot(SHLow2(:,1),SHLow2(:,end), 'g');
% % plot(theory_time+5, SHHigh1_k(1,2)*exp(-SHHigh1_k(1,1)*theory_time), 'k.')
% % plot(theory_time+5, SHHigh2_k(1,2)*exp(-SHHigh2_k(1,1)*theory_time), 'b.')
% % plot(theory_time+5, SHLow1_k(1,2)*exp(-SHLow1_k(1,1)*theory_time), 'r.')
% % plot(theory_time+5, SHLow2_k(1,2)*exp(-SHLow2_k(1,1)*theory_time), 'g.')
% title('Sham');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Concentration of UFP');
% legend(strcat('high1 k=',num2str(SHHigh1_k(1))), strcat('high2 k=',num2str(SHHigh2_k(1))), strcat('low1 k=',num2str(SHLow1_k(1))),strcat('low2 k=',num2str(SHLow2_k(1))));
% hold off

% %plot the % reductions across each trial
% figure
% hold on
% plot(bins, SHHigh1_k(2:end,4), 'k');
% plot(bins, SHHigh2_k(2:end,4), 'b');
% plot(bins, SHLow1_k(2:end,4), 'r');
% plot(bins, SHLow2_k(2:end,4), 'g');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of Sham')
% legend('high1', 'high2', 'low1', 'low2');
% hold off