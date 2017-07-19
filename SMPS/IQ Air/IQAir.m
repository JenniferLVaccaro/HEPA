% plot all of the things for IQ Air

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
IQHigh1 = save_better('IQ Air/High 1.csv', 75, plot_bool);
IQHigh2 = save_better('IQ Air/High 2.csv', 75, plot_bool);
IQLow1 = save_better('IQ Air/Low 1.csv', 75, plot_bool);
IQLow2 = save_better('IQ Air/Low 2.csv', 75, plot_bool);

IQHigh_extime = 880/309.9;
IQLow_extime = 880/75;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
IQHigh1_k = smps_k_vals(IQHigh1, plot_k);
IQHigh2_k = smps_k_vals(IQHigh2, plot_k);
IQLow1_k = smps_k_vals(IQLow1, plot_k);
IQLow2_k = smps_k_vals(IQLow2, plot_k);
IQ_kvals = [IQHigh1_k(1,:); IQHigh2_k(1,:); IQLow1_k(1,:); IQLow2_k(1,:)];

theory_time = 0:.1:80;
IQHigh = [0.19483	0.013732014];
IQLow = [0.086746	0.011917578];
figure
hold on
plot(IQHigh1(:,1),IQHigh1(:,end)/IQHigh1_k(1,2), 'kx');
plot(IQHigh2(:,1)-1,IQHigh2(:,end)/IQHigh2_k(1,2), 'k+');
plot(theory_time+5, exp(-IQHigh(1)*theory_time), 'k');
plot(IQLow1(:,1)-2,IQLow1(:,end)/IQLow1_k(1,2), 'rx');
plot(IQLow2(:,1)-1,IQLow2(:,end)/IQLow2_k(1,2), 'r+');
plot(theory_time+5, exp(-IQLow(1)*theory_time), 'r');

plot(theory_time+5, exp(-(IQHigh(1)+IQHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(IQHigh(1)-IQHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(IQLow(1)+IQLow(2))*theory_time), 'r:');
plot(theory_time+5, exp(-(IQLow(1)-IQLow(2))*theory_time), 'r:');
axis([0 90 -.02 1])
title('IQ Air');
xlabel('Time since extinguishing (minutes)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(IQHigh(1),2),'\pm',num2str(IQHigh(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(IQLow(1),2),'\pm',num2str(IQLow(2),2)));
hold off

IQHigh_ex = IQHigh*IQHigh_extime;
IQLow_ex = IQLow*IQLow_extime;
figure
hold on
plot(IQHigh1(:,1)/IQHigh_extime,IQHigh1(:,end)/IQHigh1_k(1,2), 'kx');
plot(IQHigh2(:,1)/IQHigh_extime,IQHigh2(:,end)/IQHigh2_k(1,2), 'k+');
plot((theory_time+5)/IQHigh_extime, exp(-IQHigh(1)*theory_time), 'k');
plot(IQLow1(:,1)/IQLow_extime,IQLow1(:,end)/IQLow1_k(1,2), 'rx');
plot(IQLow2(:,1)/IQLow_extime,IQLow2(:,end)/IQLow2_k(1,2), 'r+');
plot((theory_time+5)/IQLow_extime, exp(-IQLow(1)*theory_time), 'r')

plot((theory_time+5)/IQHigh_extime, exp(-(IQHigh(1)+IQHigh(2))*theory_time), 'k:');
plot((theory_time+5)/IQHigh_extime, exp(-(IQHigh(1)-IQHigh(2))*theory_time), 'k:');
plot((theory_time+5)/IQLow_extime, exp(-(IQLow(1)+IQLow(2))*theory_time), 'r:');
plot((theory_time+5)/IQLow_extime, exp(-(IQLow(1)-IQLow(2))*theory_time), 'r:');
axis([0 20 -.02 1])
title('IQ Air (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(IQHigh_ex(1),2),'\pm',num2str(IQHigh_ex(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(IQLow_ex(1),2),'\pm',num2str(IQLow_ex(2),2)));
hold off

Hteez = transpose(theory_time/IQHigh_extime);
Hyeez = exp(-IQHigh(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)
Lteez = transpose(theory_time/IQLow_extime);
Lyeez = exp(-IQLow(1)*theory_time);
ell = Lyeez(Lteez>0.99);
1-ell(1)

%Plot ufps of each trial over time with their k theoretical fits
% theory_time = 0:50;
% figure
% IQld on
% plot(IQHigh1(:,1),IQHigh1(:,end), 'k');
% plot(IQHigh2(:,1),IQHigh2(:,end), 'b');
% plot(IQLow1(:,1),IQLow1(:,end), 'r');
% plot(IQLow2(:,1),IQLow2(:,end), 'g');
% plot(theory_time+5, IQHigh1_k(1,2)*exp(-IQHigh1_k(1,1)*theory_time), 'k.')
% plot(theory_time+6, IQHigh2_k(1,2)*exp(-IQHigh2_k(1,1)*theory_time), 'b.')
% plot(theory_time+8, IQLow1_k(1,2)*exp(-IQLow1_k(1,1)*theory_time), 'r.')
% plot(theory_time+7, IQLow2_k(1,2)*exp(-IQLow2_k(1,1)*theory_time), 'g.')
% title('IQ Air');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Concentration of UFP (#/cm^{3})');
% legend(strcat('high1 k=',num2str(IQHigh1_k(1))), strcat('high2 k=',num2str(IQHigh2_k(1))), strcat('low1 k=',num2str(IQLow1_k(1))),strcat('low2 k=',num2str(IQLow2_k(1))));
% IQld off

%plot the % reductions across each trial
% figure
% IQld on
% plot(bins, IQHigh1_k(2:end,3), 'k');
% plot(bins, IQHigh2_k(2:end,3), 'b');
% plot(bins, IQLow1_k(2:end,3), 'r');
% plot(bins, IQLow2_k(2:end,3), 'g');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of IQ air')
% legend('high1', 'high2', 'low1', 'low2');
% IQld off