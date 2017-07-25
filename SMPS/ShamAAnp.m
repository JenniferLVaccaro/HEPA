
close all


figure('rend','painters','pos',[10 10 850 550])
hold on
plot(AAHigh1(:,1)-1-5,AAHigh1(:,end)/AAHigh1_k(1,2), 'Color', [1 .5 .5], 'linestyle', 'x', 'LineWidth', 1);
plot(AAHigh2(:,1)-5,AAHigh2(:,end)/AAHigh2_k(1,2), 'Color', [1 .5 .5], 'linestyle', 'o', 'LineWidth', 1);
plot(theory_time+5-5, exp(-AAHigh(1)*theory_time), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 2);
plot(AALow1(:,1)-5,AALow1(:,end)/AALow1_k(1,2), 'Color', [1 .5 .5], 'linestyle', '+', 'LineWidth', 1);
plot(AALow2(:,1)-5,AALow2(:,end)/AALow2_k(1,2), 'Color', [1 .5 .5], 'linestyle', '*', 'LineWidth', 1);
plot(theory_time+5-5, exp(-AALow(1)*theory_time), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 2);

plot(SHHigh1(:,1)-5,SHHigh1(:,end)/SHHigh1_k(1,2), 'Color', [.5 .5 .5], 'linestyle', 'x', 'LineWidth', 1);
plot(SHHigh2(:,1)-1-5,SHHigh2(:,end)/SHHigh2_k(1,2), 'Color', [.5 .5 .5], 'linestyle', 'o', 'LineWidth', 1);
plot(theory_time+5-5, exp(-SHHigh(1)*theory_time), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 2);
plot(SHLow1(:,1)-2-5,SHLow1(:,end)/SHLow1_k(1,2), 'Color', [.5 .5 .5], 'linestyle', '+', 'LineWidth', 1);
plot(SHLow2(:,1)-1-5,SHLow2(:,end)/SHLow2_k(1,2), 'Color', [.5 .5 .5], 'linestyle', '*', 'LineWidth', 1);
plot(theory_time+5-5, exp(-SHLow(1)*theory_time), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 2);

axis([0 30 -.02 1])
title('Normalized UFP of Austin Air and Sham with fit', 'FontSize', 12);
xlabel('Time since extinguish (min)', 'FontSize', 12);
ylabel('Normalized UFP concentration', 'FontSize', 12);
%legend('AAnp high trial 1', 'AAnp high trial 2', strcat('AAnp high fit k=',num2str(AAHigh(1),2),'\pm',num2str(AAHigh(2),2),'; R^2=',num2str(AAHigh_r2,2)), 'AAnp low trial 1', 'AAnp low trial 2', strcat('AAnp low fit k=',num2str(AALow(1),2),'\pm',num2str(AALow(2),2),'; R^2=',num2str(AALow_r2,2)), ...
%    'Sham high trial 1', 'Sham high Trial 2', strcat('Sham high fit k=',num2str(SHHigh(1),2),'\pm',num2str(SHHigh(2),2),'; R^2=',num2str(SHHigh_r2,2)), 'Sham low trial 1', 'Sham low trial 2', strcat('Sham low fit k=',num2str(SHLow(1),2),'\pm',num2str(SHLow(2),2),'; R^2=',num2str(SHLow_r2,2)) ...
%);
hold off





HOHigh_bin_avg = .5*(HOHigh1_k(2:end,:)+HOHigh2_k(2:end,:));
AALow_bin_avg = .5*(AALow1_k(2:end,:)+AALow2_k(2:end,:));
SHHigh_bin_avg = .5*(SHHigh1_k(2:end,:)+SHHigh2_k(2:end,:));
figure('rend','painters','pos',[10 10 850 550])
hold on
b = bar(log(bins),[HOHigh_bin_avg(:,3) BFHigh_bin_avg(:,3)], .5)%, .75, 'FaceColor', [1 1 1], 'EdgeColor', [1 .3 .3]);
set(b(1), 'FaceColor',[.1 .6 .6]);
set(b(1), 'EdgeColor',[.1 .6 .6]);
% set(b(1), 'BarWidth',1.5);
set(b(2), 'FaceColor',[1 .3 .3]);
set(b(2), 'EdgeColor',[1 .3 .3]);
% b(2).FaceColor = 'r';
% bar(log(bins),SHHigh_bin_avg(:,1), .75, 'FaceColor', [.3 .3 .3], 'EdgeColor', [.3 .3 .3]);
logxts = get(gca, 'XTick');
expxts = exp(logxts);
set(gca,'XTickLabel',floor(5*expxts)/5);
% axis([4 256 -.02 .35]);
title('Decay rate by particle size', 'FontSize', 12);
legend('HO high','BF high');
ylabel('K (min)', 'FontSize', 12);
xlabel('Particle diameter (nm)', 'FontSize', 12);
hold off

figure('rend','painters','pos',[10 10 850 550])
hold on
bar(log(bins),AAHigh_bin_avg(:,3), .75, 'FaceColor', [1 1 1], 'EdgeColor', [1 .3 .3]);
errorbar(downsample(log(bins),5),downsample(AAHigh_bin_avg(:,3),5),downsample(AAHigh_bin_avg(:,3)/10,5), 'g.')
bar(log(bins),SHHigh_bin_avg(:,3), .75, 'FaceColor', [.3 .3 .3], 'EdgeColor', [.3 .3 .3]);
errorbar(downsample(log(bins),5),downsample(SHHigh_bin_avg(:,3),5),downsample(SHHigh_bin_avg(:,3)/10,5), 'g.')
logxts = get(gca, 'XTick');
expxts = exp(logxts);
set(gca,'XTickLabel',floor(5*expxts)/5);

% axis([4 256 -.02 .35]);
title('Percent reduction by particle size', 'FontSize', 12);
legend('AA high','Sham high');
ylabel('% Reduction', 'FontSize', 12);
xlabel('Particle diameter (nm)', 'FontSize', 12);
hold off

figure('rend','painters','pos',[10 10 850 550])
hold on
bar(log(bins),AAHigh_bin_avg(:,4), .75, 'FaceColor', [1 1 1], 'EdgeColor', [1 .3 .3]);
bar(log(bins),SHHigh_bin_avg(:,4), .75, 'FaceColor', [.3 .3 .3], 'EdgeColor', [.3 .3 .3]);
logxts = get(gca, 'XTick');
expxts = exp(logxts);
set(gca,'XTickLabel',floor(5*expxts)/5);

% axis([4 256 -.02 .35]);
title('R^{2} value by particle size', 'FontSize', 12);
legend('AA high','Sham high');
ylabel('R^{2} Value', 'FontSize', 12);
xlabel('Particle diameter (nm)', 'FontSize', 12);
hold off

figure('rend','painters','pos',[10 10 850 550])
hold on
% bar(log(bins),SHHigh_bin_avg(:,3)./AAHigh_bin_avg(:,3), .75, 'FaceColor', [1 .3 .3], 'EdgeColor', [1 .3 .3]);
bar(log(bins),[(AAHigh_bin_avg(:,3)-SHHigh_bin_avg(:,3))./AAHigh_bin_avg(:,3), SHHigh_bin_avg(:,3)./AAHigh_bin_avg(:,3)], 'stacked');%, 'FaceColor', [.3 .3 .3], 'EdgeColor', [.3 .3 .3]);
logxts = get(gca, 'XTick');
expxts = exp(logxts);
set(gca,'XTickLabel',floor(5*expxts)/5);

% axis([4 256 -.02 .35]);
title('% REDUCTION META LIFE', 'FontSize', 12);
legend('SH high','AA high');
ylabel('% Reduction of % Reduction LOL', 'FontSize', 12);
xlabel('Particle diameter (nm)', 'FontSize', 12);
hold off

[K1, s1] = polyfit(bins, SHHigh_bin_avg(:,3), 1);
rsqu1 = 1-s1.normr^2/norm(SHHigh_bin_avg(:,3)-mean(SHHigh_bin_avg(:,3)))^2;
[K2, s2] = polyfit(bins, HOHigh_bin_avg(:,3), 1);
rsqu2 = 1-s2.normr^2/norm(HOHigh_bin_avg(:,3)-mean(HOHigh_bin_avg(:,3)))^2;


% x = 10+2*randn(1, 100);                 % Create data
% bins = linspace(floor(min(x)), ceil(max(x)), 25);   % Define bins
% xc = histc(x,bins);                     % Do histogram counts
% figure(1)
% bar(log(bins), xc)                      % Plot bars against log of ‘bins’
% logxts = get(gca, 'XTick');              % 'XTick' values currently logarithmic
% expxts = exp(logxts);                   % Take antilog to use them as new ‘XTickLabels’
% set(gca, 'XTickLabel', floor(100*expxts)/100)
