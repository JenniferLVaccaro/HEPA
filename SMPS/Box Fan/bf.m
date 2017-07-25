% plot all of the things for Box Fan

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
BFHigh1 = save_better('Box Fan/High 1.csv', 75, plot_bool);
BFHigh2 = save_better('Box Fan/High 2.csv', 75, plot_bool);
BFLow1 = save_better('Box Fan/Low1.csv', 65, plot_bool);
BFLow2 = save_better('Box Fan/Low2.csv', 75, plot_bool);

BFHigh_extime = 880/45;
BFLow_extime = 880/28;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
BFHigh1_k = smps_k_vals(BFHigh1, plot_k);
BFHigh2_k = smps_k_vals(BFHigh2, plot_k);
BFLow1_k = smps_k_vals(BFLow1, plot_k);
BFLow2_k = smps_k_vals(BFLow2, plot_k);
BF_kvals = [BFHigh1_k(1,:); BFHigh2_k(1,:); BFLow1_k(1,:); BFLow2_k(1,:)];

theory_time = 0:.2:80;
BFHigh = [0.126245	0.017797878];
BFLow = [0.0903275	0.00431123];

figure
hold on
plot(BFHigh1(:,1),BFHigh1(:,end)/BFHigh1_k(1,2), 'kx');
plot(BFHigh2(:,1),BFHigh2(:,end)/BFHigh2_k(1,2), 'k+');
plot((theory_time+5), exp(-BFHigh(1)*theory_time), 'k');
plot(BFLow1(:,1),BFLow1(:,end)/BFLow1_k(1,2), 'rx');
plot(BFLow2(:,1),BFLow2(:,end)/BFLow2_k(1,2), 'r+');
plot((theory_time+5), exp(-BFLow(1)*theory_time), 'r')

plot((theory_time+5), exp(-(BFHigh(1)+BFHigh(2))*theory_time), 'k:');
plot((theory_time+5), exp(-(BFHigh(1)-BFHigh(2))*theory_time), 'k:');
plot((theory_time+5), exp(-(BFLow(1)+BFLow(2))*theory_time), 'r:');
plot((theory_time+5), exp(-(BFLow(1)-BFLow(2))*theory_time), 'r:');
axis([0 90 -.02 1])
title('Box Fan (time)');
xlabel('Time since extinguishing (min)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(BFHigh(1),2),'\pm',num2str(BFHigh(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(BFLow(1),2),'\pm',num2str(BFLow(2),2)));
hold off

BFHigh_ex = BFHigh*BFHigh_extime;
BFLow_ex = BFHigh*BFLow_extime;
figure
hold on
plot(BFHigh1(:,1)/BFHigh_extime,BFHigh1(:,end)/BFHigh1_k(1,2), 'kx');
plot(BFHigh2(:,1)/BFHigh_extime,BFHigh2(:,end)/BFHigh2_k(1,2), 'k+');
plot((theory_time+5)/BFHigh_extime, exp(-BFHigh(1)*theory_time), 'k');
plot(BFLow1(:,1)/BFLow_extime,BFLow1(:,end)/BFLow1_k(1,2), 'rx');
plot(BFLow2(:,1)/BFLow_extime,BFLow2(:,end)/BFLow2_k(1,2), 'r+');
plot((theory_time+5)/BFLow_extime, exp(-BFLow(1)*theory_time), 'r')

plot((theory_time+5)/BFHigh_extime, exp(-(BFHigh(1)+BFHigh(2))*theory_time), 'k:');
plot((theory_time+5)/BFHigh_extime, exp(-(BFHigh(1)-BFHigh(2))*theory_time), 'k:');
plot((theory_time+5)/BFLow_extime, exp(-(BFLow(1)+BFLow(2))*theory_time), 'r:');
plot((theory_time+5)/BFLow_extime, exp(-(BFLow(1)-BFLow(2))*theory_time), 'r:');
axis([0 20 -.02 1])
title('Box Fan (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(BFHigh_ex(1),2),'\pm',num2str(BFHigh_ex(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(BFLow_ex(1),2),'\pm',num2str(BFLow_ex(2),2)));
hold off

theory_time = 0:.1:80;
Hteez = transpose(theory_time/BFHigh_extime);
Hyeez = exp(-BFHigh(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)
Lteez = transpose(theory_time/BFLow_extime);
Lyeez = exp(-BFLow(1)*theory_time);
ell = Lyeez(Lteez>0.99);
1-ell(1)

%Plot ufps of each trial over time with their k theoretical fits
% theory_time = 0:80;
% BFHigh = [0.22021 0.000311127];
% BFLow = [0.084622 0.003348858];
% figure
% hold on
% plot(BFHigh1(:,1),BFHigh1(:,end), 'k');
% plot(BFHigh2(:,1),BFHigh2(:,end), 'b');
% plot(BFLow1(:,1),BFLow1(:,end), 'r');
% plot(BFLow2(:,1),BFLow2(:,end), 'g');
% plot(theory_time+5, BFHigh1_k(1,2)*exp(-BFHigh1_k(1,1)*theory_time), 'k.')
% plot(theory_time+5, BFHigh2_k(1,2)*exp(-BFHigh2_k(1,1)*theory_time), 'b.')
% plot(theory_time+5, BFLow1_k(1,2)*exp(-BFLow1_k(1,1)*theory_time), 'r.')
% plot(theory_time+5, BFLow2_k(1,2)*exp(-BFLow2_k(1,1)*theory_time), 'g.')
% title('Box Fan');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Concentration of UFP (#/cm^{3})');
% legend(strcat('high1 k=',num2str(BFHigh1_k(1))), strcat('high2 k=',num2str(BFHigh2_k(1))), strcat('low1 k=',num2str(BFLow1_k(1))),strcat('low2 k=',num2str(BFLow2_k(1))));
% hold off

% %plot the % reductions across each trial
% figure
% hold on
% plot(bins, BFHigh1_k(2:end,4), 'k');
% plot(bins, BFHigh2_k(2:end,4), 'b');
% plot(bins, BFLow1_k(2:end,4), 'r');
% plot(bins, BFLow2_k(2:end,4), 'g');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of Box Fan')
% legend('high1', 'high2', 'low1', 'low2');
% hold off