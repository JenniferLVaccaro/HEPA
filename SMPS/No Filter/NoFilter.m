% plot all of the things for No Filter

%Extract data and calculate ufps over time. Toggle plot_bool to plot every
%bin over time
plot_bool = false;
NOmin1 = save_better('No Filter/30min 1.csv', 550, plot_bool);
NOmin2 = save_better('No Filter/30min 2.csv', 500, plot_bool);
NOmin1a = save_better('No Filter/30min 1.csv', 510, plot_bool);
NOmin2a = save_better('No Filter/30min 2.csv', 460, plot_bool);
%Baseline1 = save_better('Baseline1.csv', 75, plot_bool);
%Baseline2 = save_better('Baseline2.csv', 170, plot_bool);

%calculate k values. Toggle plot_k to plot ks across bins
plot_k = false;
NOmin1_k = smps_k_vals(NOmin1, plot_k);
NOmin2_k = smps_k_vals(NOmin2, plot_k);
NOmin1a_k = smps_k_vals(NOmin1a, plot_k);
NOmin2a_k = smps_k_vals(NOmin2a, plot_k);
%Baseline1_k = smps_k_vals(Baseline1, plot_k);
%Baseline2_k = smps_k_vals(Baseline2, plot_k);

%Plot ufps of each trial over time with their k theoretical fits
theory_time = 0:50;
figure
hold on
plot(NOmin1(:,1),NOmin1(:,end), 'k');
plot(NOmin2(:,1),NOmin2(:,end), 'b');
%plot(Baseline1(:,1),Baseline1(:,end), 'r');
%plot(Baseline2(:,1),Baseline2(:,end), 'g');
plot(theory_time+5, NOmin1_k(1,2)*exp(-NOmin1_k(1,1)*theory_time), 'k.')
plot(theory_time+5, NOmin2_k(1,2)*exp(-NOmin2_k(1,1)*theory_time), 'b.')
plot(theory_time+45, NOmin1a_k(1,2)*exp(-NOmin1_k(1,1)*theory_time), 'g.')
plot(theory_time+45, NOmin2a_k(1,2)*exp(-NOmin2_k(1,1)*theory_time), 'r.')
% plot(theory_time+5, Baseline1_k(1,2)*exp(-Baseline1_k(1,1)*theory_time), 'r.')
% plot(theory_time+5, Baseline2_k(1,2)*exp(-Baseline2_k(1,1)*theory_time), 'g.')
title('No Filter');
xlabel('Time since extinguishing (minutes)');
ylabel('Concentration of UFP (#/cm^{3})');
legend(strcat('30min1 k=',num2str(NOmin1_k(1))), strcat('30min2 k=',num2str(NOmin2_k(1))), strcat('30min1 k=',num2str(NOmin1a_k(1))), strcat('30min2 k=',num2str(NOmin2a_k(1)))) ;%, strcat('bline1 k=',num2str(Baseline1_k(1))),strcat('bline2 k=',num2str(Baseline2_k(1))));
hold off

% %plot the % reductions across each trial
% figure
% hold on
% plot(bins, NOmin1_k(2:end,3), 'k');
% plot(bins, NOmin2_k(2:end,3), 'b');
% %plot(bins, Baseline1_k(2:end,3), 'r');
% %plot(bins, Baseline2_k(2:end,3), 'g');
% xlabel('Bin size nm');
% ylabel('% reduction after 35 minutes');
% title('Percent reduction of No Filter')
% legend('30min1', '30min2');%, 'bline1', 'bline2');
% hold off