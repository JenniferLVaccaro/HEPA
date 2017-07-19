% plot all of the things for Austin Air with prefilter

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
AApHigh1 = save_better('Austin Air PREFILTER/High 1.csv', 78, plot_bool);
AApHigh2 = save_better('Austin Air PREFILTER/High 2.csv', 75, plot_bool);
AApLow1 = save_better('Austin Air PREFILTER/Low 1.csv', 80, plot_bool);
AApLow2 = save_better('Austin Air PREFILTER/Low 2.csv', 75, plot_bool);
AApMed1 = save_better('Austin Air PREFILTER/Medium1.csv', 77, plot_bool);
%Med2 = save_better('Medium2.csv', 90, plot_bool);

AApHigh_extime = 880/264;
AApLow_extime = 880/83.2;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
AApHigh1_k = smps_k_vals(AApHigh1, plot_k);
AApHigh2_k = smps_k_vals(AApHigh2, plot_k);
AApLow1_k = smps_k_vals(AApLow1, plot_k);
AApLow2_k = smps_k_vals(AApLow2, plot_k);
AApMed1_k = smps_k_vals(AApMed1, plot_k);
% Med2_k = smps_k_vals(Med2, plot_k);
AAp_kvals = [AApHigh1_k(1,:); AApHigh2_k(1,:); AApLow1_k(1,:); AApLow2_k(1,:); AApMed1_k(1,:)];


%Plot ufps of each trial over time with their k theoretical fits
theory_time = 0:80;
AApHigh = [0.22021 0.000311127];
AApLow = [0.084622 0.003348858];
figure
hold on
plot(AApHigh1(:,1)-3,AApHigh1(:,end)/AApHigh1_k(1,2), 'kx');
plot(AApHigh2(:,1),AApHigh2(:,end)/AApHigh2_k(1,2), 'k+');
plot(theory_time+5, exp(-AApHigh(1)*theory_time), 'k');
plot(AApLow1(:,1),AApLow1(:,end)/AApLow1_k(1,2), 'rx');
plot(AApLow2(:,1),AApLow2(:,end)/AApLow2_k(1,2), 'r+');
plot(theory_time+5, exp(-AApLow(1)*theory_time), 'r');

plot(theory_time+5, exp(-(AApHigh(1)+AApHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(AApHigh(1)-AApHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(AApLow(1)+AApLow(2))*theory_time), 'r:');
plot(theory_time+5, exp(-(AApLow(1)-AApLow(2))*theory_time), 'r:');
% plot(AApMed1(:,1),AApMed1(:,end), 'c');
% plot(Med2(:,1),Med2(:,end), 'y');
% plot(theory_time+8, AApHigh1_k(1,2)*exp(-AApHigh1_k(1,1)*theory_time), 'k.')
% plot(theory_time+5, AApHigh2_k(1,2)*exp(-AApHigh2_k(1,1)*theory_time), 'b.')
% plot(theory_time+5, AApLow1_k(1,2)*exp(-AApLow1_k(1,1)*theory_time), 'r.')
% plot(theory_time+5, AApLow2_k(1,2)*exp(-AApLow2_k(1,1)*theory_time), 'g.')
% plot(theory_time+7, AApMed1_k(1,2)*exp(-AApMed1_k(1,1)*theory_time), 'c.')
% plot(theory_time+5, Med2_k(1,2)*exp(-Med2_k(1,1)*theory_time), 'y.')
axis([0 90 -.02 1])
title('Austin Air with prefilter');
xlabel('Time since extinguishing (minutes)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(AApHigh(1),2),'\pm',num2str(AApHigh(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(AApLow(1),2),'\pm',num2str(AApLow(2),2)));
hold off

AApHigh_ex = AApHigh*AApHigh_extime;
AApLow_ex = AApHigh*AApLow_extime;
figure
hold on
plot(AApHigh1(:,1)/AApHigh_extime,AApHigh1(:,end)/AApHigh1_k(1,2), 'kx');
plot(AApHigh2(:,1)/AApHigh_extime,AApHigh2(:,end)/AApHigh2_k(1,2), 'k+');
plot((theory_time+5)/AApHigh_extime, exp(-AApHigh(1)*theory_time), 'k');
plot(AApLow1(:,1)/AApLow_extime,AApLow1(:,end)/AApLow1_k(1,2), 'rx');
plot(AApLow2(:,1)/AApLow_extime,AApLow2(:,end)/AApLow2_k(1,2), 'r+');
plot((theory_time+5)/AApLow_extime, exp(-AApLow(1)*theory_time), 'r')

% plot((theory_time+5)/AApHigh_extime, exp(-(AApHigh(1)+AApHigh(2))*theory_time), 'k:');
% plot((theory_time+5)/AApHigh_extime, exp(-(AApHigh(1)-AApHigh(2))*theory_time), 'k:');
% plot((theory_time+5)/AApLow_extime, exp(-(AApLow(1)+AApLow(2))*theory_time), 'r:');
% plot((theory_time+5)/AApLow_extime, exp(-(AApLow(1)-AApLow(2))*theory_time), 'r:');
axis([0 20 -.02 1])
title('Austin Air with prefilter (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(AApHigh_ex(1),2),'\pm',num2str(AApHigh_ex(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(AApLow_ex(1),2),'\pm',num2str(AApLow_ex(2),2)));
hold off

theory_time = 0:.1:80;
Hteez = transpose(theory_time/AApHigh_extime);
Hyeez = exp(-AApHigh(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)
Lteez = transpose(theory_time/AApLow_extime);
Lyeez = exp(-AApLow(1)*theory_time);
ell = Lyeez(Lteez>0.99);
1-ell(1)

%plot the % reductions across each trial
% figure
% hold on
% plot(bins, AApHigh1_k(2:end,3), 'k');
% plot(bins, AApHigh2_k(2:end,3), 'b');
% plot(bins, AApLow1_k(2:end,3), 'r');
% plot(bins, AApLow2_k(2:end,3), 'g');
% plot(bins, AApMed1_k(2:end,3), 'c');
% %plot(bins, High1_k(2:end,3), 'y');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of Austin Air prefilter')
% legend('high1', 'high2', 'low1', 'low2', 'med1');
% hold off
