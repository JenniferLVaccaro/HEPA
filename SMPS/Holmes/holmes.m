% plot all of the things for Holmes (Xi Xi)
plot_bool = false;
HOHigh1 = save_better('Holmes (Xi Xi)/High 1.csv', 75, plot_bool);
HOHigh2 = save_better('Holmes (Xi Xi)/High 2.csv', 75, plot_bool);
HOLow1 = save_better('Holmes (Xi Xi)/Low 1.csv', 75, plot_bool);
HOLow2 = save_better('Holmes (Xi Xi)/Low 2.csv', 75, plot_bool);
HOMed1 = save_better('Holmes (Xi Xi)/Medium 1.csv', 75, plot_bool);
HOMed2 = save_better('Holmes (Xi Xi)/Medium 2.csv', 75, plot_bool);

HOHigh_extime = 880/94.4;
HOLow_extime = 880/53.2;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
HOHigh1_k = smps_k_vals(HOHigh1, plot_k);
HOHigh2_k = smps_k_vals(HOHigh2, plot_k);
HOLow1_k = smps_k_vals(HOLow1, plot_k);
HOLow2_k = smps_k_vals(HOLow2, plot_k);
HOMed1_k = smps_k_vals(HOMed1, plot_k);
HOMed2_k = smps_k_vals(HOMed2, plot_k);
HO_kvals = [HOHigh1_k(1,:); HOHigh2_k(1,:); HOLow1_k(1,:); HOLow2_k(1,:); HOMed1_k(1,:); HOMed2_k(1,:)];

theory_time = 0:80;
HOHigh = [0.162865	0.002481945];
HOLow = [0.131425	0.025307352];
figure
hold on
plot(HOHigh1(:,1),HOHigh1(:,end)/HOHigh1_k(1,2), 'kx');
plot(HOHigh2(:,1),HOHigh2(:,end)/HOHigh2_k(1,2), 'k+');
plot(theory_time+5, exp(-HOHigh(1)*theory_time), 'k');
plot(HOLow1(:,1)-3,HOLow1(:,end)/HOLow1_k(1,2), 'rx');
plot(HOLow2(:,1),HOLow2(:,end)/HOLow2_k(1,2), 'r+');
plot(theory_time+5, exp(-HOLow(1)*theory_time), 'r');

plot(theory_time+5, exp(-(HOHigh(1)+HOHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(HOHigh(1)-HOHigh(2))*theory_time), 'k:');
plot(theory_time+5, exp(-(HOLow(1)+HOLow(2))*theory_time), 'r:');
plot(theory_time+5, exp(-(HOLow(1)-HOLow(2))*theory_time), 'r:');
axis([0 90 -.02 1])
title('Holmes');
xlabel('Time since extinguishing (minutes)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(HOHigh(1),2),'\pm',num2str(HOHigh(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(HOLow(1),2),'\pm',num2str(HOLow(2),2)));
hold off

HOHigh_ex = HOHigh*HOHigh_extime;
HOLow_ex = HOHigh*HOLow_extime;
figure
hold on
plot(HOHigh1(:,1)/HOHigh_extime,HOHigh1(:,end)/HOHigh1_k(1,2), 'kx');
plot(HOHigh2(:,1)/HOHigh_extime,HOHigh2(:,end)/HOHigh2_k(1,2), 'k+');
plot((theory_time+5)/HOHigh_extime, exp(-HOHigh(1)*theory_time), 'k');
plot(HOLow1(:,1)/HOLow_extime,HOLow1(:,end)/HOLow1_k(1,2), 'rx');
plot(HOLow2(:,1)/HOLow_extime,HOLow2(:,end)/HOLow2_k(1,2), 'r+');
plot((theory_time+5)/HOLow_extime, exp(-HOLow(1)*theory_time), 'r')

plot((theory_time+5)/HOHigh_extime, exp(-(HOHigh(1)+HOHigh(2))*theory_time), 'k:');
plot((theory_time+5)/HOHigh_extime, exp(-(HOHigh(1)-HOHigh(2))*theory_time), 'k:');
plot((theory_time+5)/HOLow_extime, exp(-(HOLow(1)+HOLow(2))*theory_time), 'r:');
plot((theory_time+5)/HOLow_extime, exp(-(HOLow(1)-HOLow(2))*theory_time), 'r:');
axis([0 12 -.02 1])
title('Holmes (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(HOHigh_ex(1),2),'\pm',num2str(HOHigh_ex(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(HOLow_ex(1),2),'\pm',num2str(HOLow_ex(2),2)));
hold off

theory_time = 0:.1:80;
Hteez = transpose(theory_time/HOHigh_extime);
Hyeez = exp(-HOHigh(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)
Lteez = transpose(theory_time/HOLow_extime);
Lyeez = exp(-HOLow(1)*theory_time);
ell = Lyeez(Lteez>0.99);
1-ell(1)

%Plot ufps of each trial over time with their k theoretical fits
% theory_time = 0:50;
% figure
% hold on
% plot(HOHigh1(:,1),HOHigh1(:,end), 'k');
% plot(HOHigh2(:,1),HOHigh2(:,end), 'b');
% plot(HOLow1(:,1),HOLow1(:,end), 'r');
% plot(HOLow2(:,1),HOLow2(:,end), 'g');
% plot(HOMed1(:,1),HOMed1(:,end), 'c');
% plot(HOMed2(:,1),HOMed2(:,end), 'y');
% plot(theory_time+5, HOHigh1_k(1,2)*exp(-HOHigh1_k(1,1)*theory_time), 'k.')
% plot(theory_time+5, HOHigh2_k(1,2)*exp(-HOHigh2_k(1,1)*theory_time), 'b.')
% plot(theory_time+8, HOLow1_k(1,2)*exp(-HOLow1_k(1,1)*theory_time), 'r.')
% plot(theory_time+5, HOLow2_k(1,2)*exp(-HOLow2_k(1,1)*theory_time), 'g.')
% plot(theory_time+3, HOMed1_k(1,2)*exp(-HOMed1_k(1,1)*theory_time), 'c.')
% plot(theory_time+10, HOMed2_k(1,2)*exp(-HOMed2_k(1,1)*theory_time), 'y.')
% title('Holmes');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Concentration of UFP (#/cm^{3})');
% legend(strcat('high1 k=',num2str(HOHigh1_k(1))), strcat('high2 k=',num2str(HOHigh2_k(1))), strcat('low1 k=',num2str(HOLow1_k(1))),strcat('low2 k=',num2str(HOLow2_k(1))),strcat('med1 k=',num2str(HOMed1_k(1))),strcat('med2 k=',num2str(HOMed2_k(1))));
% hold off

% %plot the % reductions across each trial
% figure
% hold on
% plot(bins, HOHigh1_k(2:end,4), 'k');
% plot(bins, HOHigh2_k(2:end,4), 'b');
% plot(bins, HOLow1_k(2:end,4), 'r');
% plot(bins, HOLow2_k(2:end,4), 'g');
% plot(bins, HOMed1_k(2:end,4), 'c');
% plot(bins, HOMed2_k(2:end,4), 'y');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of Holmes')
% legend('high1', 'high2', 'low1', 'low2', 'med1', 'med2');
% hold off