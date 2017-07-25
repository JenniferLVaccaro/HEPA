% plot all of the things for Austin Air no prefilter

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
AAHigh1 = save_better('Austin Air NO PREFILTER/High 1.csv', 75, plot_bool);
AAHigh2 = save_better('Austin Air NO PREFILTER/High 2.csv', 75, plot_bool);
AALow1 = save_better('Austin Air NO PREFILTER/Low 1.csv', 75, plot_bool);
AALow2 = save_better('Austin Air NO PREFILTER/Low 2.csv', 75, plot_bool);
AAMed1 = save_better('Austin Air NO PREFILTER/Medium 1.csv', 78, plot_bool);
AAMed4 = save_better('Austin Air NO PREFILTER/Medium 4.csv', 80, plot_bool);

AAHigh_extime = 880/241;
AALow_extime = 880/73.6;

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
AAHigh1_k = smps_k_vals(AAHigh1, plot_k);
AAHigh2_k = smps_k_vals(AAHigh2, plot_k);
AALow1_k = smps_k_vals(AALow1, plot_k);
AALow2_k = smps_k_vals(AALow2, plot_k);
AAMed1_k = smps_k_vals(AAMed1, plot_k);
AAMed4_k = smps_k_vals(AAMed4, plot_k);
AA_kvals = [AAHigh1_k(1,:); AAHigh2_k(1,:); AALow1_k(1,:); AALow2_k(1,:); AAMed1_k(1,:); AAMed4_k(1,:)];
AAHigh_r2 = mean(AA_kvals(1:2,4));
AALow_r2 = mean(AA_kvals(3:4,4));
theory_time = 0:80;
% AAHigh = [mean(AA_kvals(1,1), AA_kvalse(2,1)), std([AA_kvals(1,1) AA_kvals(2,1)])];
% AALow = 
AAHigh = [0.243845	0.024402255];
AALow = [0.0928385	0.001233901];
figure
hold on
% plot(AAHigh1(:,1)-1,AAHigh1(:,end), 'k');
plot(AAHigh2(:,1),AAHigh2(:,end), 'k');
% plot(theory_time+5, exp(-AAHigh(1)*theory_time), 'k');
% plot(AALow1(:,1),AALow1(:,end), 'r');
% plot(AALow2(:,1),AALow2(:,end),'r');
% plot(theory_time+5, exp(-AALow(1)*theory_time), 'r');
% plot(theory_time+5, exp(-(AAHigh(1)+AAHigh(2))*theory_time), 'k:');
% plot(theory_time+5, exp(-(AAHigh(1)-AAHigh(2))*theory_time), 'k:');
% plot(theory_time+5, exp(-(AALow(1)+AALow(2))*theory_time), 'r:');
% plot(theory_time+5, exp(-(AALow(1)-AALow(2))*theory_time), 'r:');
% axis([-30 90 -.0])
title('Austin Air no prefilter raw data');
xlabel('Time since extinguishing (minutes)');
ylabel('Concentration of UFP (#/cm^{3})');
legend('High trial 2', 'High Trial 2', strcat('High fit k=',num2str(AAHigh(1),2),'\pm',num2str(AAHigh(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(AALow(1),2),'\pm',num2str(AALow(2),2)));
hold off

AAHigh_ex = AAHigh*AAHigh_extime;
AALow_ex = AAHigh*AALow_extime;
figure
hold on
plot(AAHigh1(:,1)/AAHigh_extime,AAHigh1(:,end)/AAHigh1_k(1,2), 'kx');
plot(AAHigh2(:,1)/AAHigh_extime,AAHigh2(:,end)/AAHigh2_k(1,2), 'k+');
plot((theory_time+5)/AAHigh_extime, exp(-AAHigh(1)*theory_time), 'k');
plot(AALow1(:,1)/AALow_extime,AALow1(:,end)/AALow1_k(1,2), 'rx');
plot(AALow2(:,1)/AALow_extime,AALow2(:,end)/AALow2_k(1,2), 'r+');
plot((theory_time+5)/AALow_extime, exp(-AALow(1)*theory_time), 'r')

% plot((theory_time+5)/AAHigh_extime, exp(-(AAHigh(1)+AAHigh(2))*theory_time), 'k:');
% plot((theory_time+5)/AAHigh_extime, exp(-(AAHigh(1)-AAHigh(2))*theory_time), 'k:');
% plot((theory_time+5)/AALow_extime, exp(-(AALow(1)+AALow(2))*theory_time), 'r:');
% plot((theory_time+5)/AALow_extime, exp(-(AALow(1)-AALow(2))*theory_time), 'r:');
axis([0 20 -.02 1])
title('Austin Air no prefilter (exchange)');
xlabel('Air exchanges since extinguishing (#)');
ylabel('Normalized UFP concentration');
legend('High trial 1', 'High Trial 2', strcat('High fit k=',num2str(AAHigh_ex(1),2),'\pm',num2str(AAHigh_ex(2),2)), 'Low trial 1', 'Low trial 2', strcat('Low fit k=',num2str(AALow_ex(1),2),'\pm',num2str(AALow_ex(2),2)));
hold off

theory_time = 0:.1:80;
Hteez = transpose(theory_time/AAHigh_extime);
Hyeez = exp(-AAHigh(1)*theory_time);
ach = Hyeez(Hteez>0.99);
1-ach(1)
Lteez = transpose(theory_time/AALow_extime);
Lyeez = exp(-AALow(1)*theory_time);
ell = Lyeez(Lteez>0.99);
1-ell(1)

%Plot ufps of each trial over time with their k theoretical fits
% theory_time = 0:80;
% figure
% hold on
% plot(AAHigh1(:,1), AAHigh1(:,end)/AAHigh1_k(1,2), 'kx');
% plot(AAHigh2(:,1), AAHigh2(:,end)/AAHigh2_k(1,2), 'k+');
% plot(theory_time+5, exp(-(0.243845)*theory_time), 'k')
% plot(AALow1(:,1), AALow1(:,end)/AALow1_k(1,2), 'rx');
% plot(AALow2(:,1),AALow2(:,end)/AALow2_k(1,2), 'r+');
% plot(theory_time+5, exp(-(0.0928385)*theory_time), 'r')
% % plot(AAMed1(:,1),AAMed1(:,end), 'c');
% % plot(AAMed4(:,1),AAMed4(:,end), 'y');
% plot(theory_time+5, exp(-(0.243845+0.024402255)*theory_time), 'k:')
% plot(theory_time+5, exp(-(0.243845-0.024402255)*theory_time), 'k:')
% plot(theory_time+5, exp(-(0.0928385+0.001233901)*theory_time), 'r:')
% plot(theory_time+5, exp(-(0.0928385-0.001233901)*theory_time), 'r:')
% % plot(theory_time+5, AAHigh1_k(1,2)*exp(-AAHigh1_k(1,1)*theory_time), 'k.')
% % plot(theory_time+5, AAHigh2_k(1,2)*exp(-AAHigh2_k(1,1)*theory_time), 'b.')
% % plot(theory_time+5, AALow1_k(1,2)*exp(-AALow1_k(1,1)*theory_time), 'r.')
% % plot(theory_time+5, AALow2_k(1,2)*exp(-AALow2_k(1,1)*theory_time), 'g.')
% % plot(theory_time+8, AAMed1_k(1,2)*exp(-AAMed1_k(1,1)*theory_time), 'c.')
% % plot(theory_time+10, AAMed4_k(1,2)*exp(-AAMed4_k(1,1)*theory_time), 'y.')
% axis([0 90 -.02 1])
% title('Austin Air no prefilter');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Concentration of UFP (#/cm^{3})');
% legend('High trial 1', 'High Trial 2', 'High fit +/- \sigma', 'Low trial 1', 'Low trial 2', 'Low fit +/- \sigma');
% % legend(strcat('high1 k=',num2str(AAHigh1_k(1))), strcat('high2 k=',num2str(AAHigh2_k(1))), strcat('low1 k=',num2str(AALow1_k(1))),strcat('low2 k=',num2str(AALow2_k(1))),strcat('med1 k=',num2str(AAMed1_k(1))),strcat('med4 k=',num2str(AAMed4_k(1))));
% hold off

% %plot the % reductions across each trial
% figure
% hold on
% plot(bins, AAHigh1_k(2:end,4), 'k');
% plot(bins, AAHigh2_k(2:end,4), 'b');
% plot(bins, AALow1_k(2:end,4), 'r');
% plot(bins, AALow2_k(2:end,4), 'g');
% plot(bins, AAMed1_k(2:end,4), 'c');
% plot(bins, AAMed4_k(2:end,4), 'y');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of Austin Air no prefilter')
% legend('high1', 'high2', 'low1', 'low2', 'med1', 'med4');
% hold off
