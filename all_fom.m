red = [1 0 0];
blue = [0 0 1];
green = [0 1 0];
yellow = [1 1 0];
cyan = [0 1 1];
magenta = [1 0 1];
white = [1 1 1];
black = [0 0 0];
purple = [.5 0 1];
forest = [0 .5 .1];
orange = [.9 .3 0];

%plot all averages

%Run everything
Sham
AAnopf
AApf
bf
HEPAirX
holmes
IQAir
% % NoFilter

AAHigh_p = mean(AA_kvals(1:2,3));
AALow_p = mean(AA_kvals(3:4,3));
AApHigh_p = mean(AAp_kvals(1:2,3));
AApLow_p = mean(AAp_kvals(3:4,3));
BFHigh_p = mean(BF_kvals(1:2,3));
BFLow_p = mean(BF_kvals(3:4,3));
AX_p = mean(AX_kvals(1:2,3));
% AXLow_p = mean(AX_kvals(3:4,3));
HOHigh_p = mean(HO_kvals(1:2,3));
HOLow_p = mean(HO_kvals(3:4,3));
IQHigh_p = mean(IQ_kvals(1:2,3));
IQLow_p = mean(IQ_kvals(3:4,3));
SHHigh_p = mean(SH_kvals(1:2,3));
SHLow_p = mean(SH_kvals(3:4,3));

High_percent_reduc = [AAHigh_p; AApHigh_p; BFHigh_p; AX_p; HOHigh_p; IQHigh_p; SHHigh_p];
Low_percent_reduc = [AALow_p; AApLow_p; BFLow_p; 0; HOLow_p; IQLow_p; SHLow_p];
percent_reduc = [High_percent_reduc Low_percent_reduc];
figure
hold on
bar(percent_reduc);
hold off
% 
theory_time = 0:.1:80;
% figure
% hold on
% plot(theory_time+5, exp(-AAHigh_avg(1)*theory_time), 'k');
% plot(theory_time+5, exp(-AApHigh_avg(1)*theory_time), 'b');
% plot(theory_time+5, exp(-BFHigh_avg(1)*theory_time), 'g');
% plot(theory_time+5, exp(-AX(1)*theory_time), 'r');
% plot(theory_time+5, exp(-HOHigh_avg(1)*theory_time), 'c');
% plot(theory_time+5, exp(-IQHigh_avg(1)*theory_time), 'm');
% plot(theory_time+5, exp(-SHHigh_avg(1)*theory_time), 'y');
% axis([0 90 -.02 1])
% title('All of the filter high fits');
% xlabel('Time since extinguishing (minutes)');
% ylabel('Normliazed UFP Concentration');
% legend('AA', 'AA', 'Box fan', 'AX', 'Holmes', 'IQ', 'Sham' );
% hold off

figure
hold on
plot(theory_time, exp(-AAHigh_ex(1)*theory_time), 'k--');
plot(theory_time, exp(-AApHigh_ex(1)*theory_time), 'b--');
plot(theory_time, exp(-BFHigh_ex(1)*theory_time), 'g--');
plot(theory_time, exp(-AX_ex(1)*theory_time), 'r');
plot(theory_time, exp(-HOHigh_ex(1)*theory_time), 'c--');
plot(theory_time, exp(-IQHigh_ex(1)*theory_time), 'm--');
plot(theory_time, exp(-SHHigh_ex(1)*theory_time), 'y--');
plot(theory_time, exp(-AALow_ex(1)*theory_time), 'k:');
plot(theory_time, exp(-AApLow_ex(1)*theory_time), 'b:');
plot(theory_time, exp(-BFLow_ex(1)*theory_time), 'g:');
plot(theory_time, exp(-HOLow_ex(1)*theory_time), 'c:');
plot(theory_time, exp(-IQLow_ex(1)*theory_time), 'm:');
plot(theory_time, exp(-SHLow_ex(1)*theory_time), 'y:');
axis([0 6 -.02 1])
title('All of the filter high fits');
xlabel('Air changes since extinguishing (minutes)');
ylabel('Normliazed UFP Concentration');
legend('AA', 'AA', 'Box fan', 'AX', 'Holmes', 'IQ', 'Sham' );
hold off

% %calculate averages
plot_avg = false;

AAHigh_avg = smps_avg(AAHigh1,AAHigh2,plot_avg);
AALow_avg = smps_avg(AALow1,AALow2,plot_avg);
AApHigh_avg = smps_avg(AApHigh1,AApHigh2,plot_avg);
AApLow_avg = smps_avg(AApLow1,AApLow2,plot_avg);
BFHigh_avg = smps_avg(BFHigh1,BFHigh2,plot_avg);
BFLow_avg = smps_avg(BFLow1,BFLow2,plot_avg);
AXHigh_avg = smps_avg(AXCool1,AXCool2,plot_avg);
AXLow_avg = smps_avg(AXHeat1,AXHeat1,plot_avg);
HOHigh_avg = smps_avg(HOHigh1,HOHigh2,plot_avg);
HOLow_avg = smps_avg(HOLow1,HOLow2,plot_avg);
IQHigh_avg = smps_avg(IQHigh1,IQHigh2,plot_avg);
IQLow_avg = smps_avg(IQLow1,IQLow2,plot_avg);
High_real_avg = smps_big_avg(AAHigh_avg, AApHigh_avg, BFHigh_avg,AXHigh_avg,HOHigh_avg,IQHigh_avg,plot_avg);
Low_real_avg = smps_big_avg(AALow_avg, AApLow_avg, BFLow_avg,AXLow_avg,HOLow_avg,IQLow_avg,plot_avg);
SHHigh_avg = smps_avg(SHHigh1,SHHigh2,plot_avg);
SHLow_avg = smps_avg(SHLow1,SHLow2,plot_avg);
High_avg_k = 0.188021944;
High_avg_k_ex = 0.768;
Low_avg_k = 0.0971918;
Low_avg_k_ex = 3.16394;

High_extime = mean([AAHigh_extime,AApHigh_extime,BFHigh_extime,HOHigh_extime,AX_extime,IQHigh_extime]);
Low_extime = mean([AALow_extime,AApLow_extime,BFLow_extime,HOLow_extime,IQLow_extime]);

% 
% % calculate k vals
% AAH_vals = find_1_k(AAHigh_avg(:,1),AAHigh_avg(:,2), true)
% % AAL_vals = find_1_k(AALow_avg(:,1),AALow_avg(:,2), true)
% AApH_vals = find_1_k(AApHigh_avg(:,1),AApHigh_avg(:,2), true)
% % AApL_vals = find_1_k(AApLow_avg(:,1),AApLow_avg(:,2), true)
% BFH_vals = find_1_k(BFHigh_avg(:,1),BFHigh_avg(:,2), true)
% % BFL_vals = find_1_k(BFLow_avg(:,1),BFLow_avg(:,2), true)
% AXH_vals = find_1_k(AXHigh_avg(:,1),AXHigh_avg(:,2), true)
% % AXL_vals = find_1_k(AXLow_avg(:,1),AXLow_avg(:,2), true)
% HOH_vals = find_1_k(HOHigh_avg(:,1),HOHigh_avg(:,2), true)
% % HOL_vals = find_1_k(HOLow_avg(:,1),HOLow_avg(:,2), true)
% IQH_vals = find_1_k(IQHigh_avg(:,1),IQHigh_avg(:,2), true)
% % IQL_vals = find_1_k(IQLow_avg(:,1),IQLow_avg(:,2), true)
% SHH_vals = find_1_k(SHHigh_avg(:,1),SHHigh_avg(:,2), true)
% % SHL_vals = find_1_k(SHLow_avg(:,1),SHLow_avg(:,2), true)
% 
% %plot highs
figure('rend','painters','pos',[10 10 700 550])
hold on
plot((AAHigh_avg(:,1)-5)/AAHigh_extime,AAHigh_avg(:,2), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1);
plot((AALow_avg(:,1)-5)/AALow_extime,AALow_avg(:,2), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1);
plot((AApHigh_avg(:,1)-5)/AApHigh_extime,AApHigh_avg(:,2), 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1);
plot((AApLow_avg(:,1)-5)/AApLow_extime,AApLow_avg(:,2), 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1);
plot((BFHigh_avg(:,1)-5)/BFHigh_extime,BFHigh_avg(:,2), 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1);
plot((BFLow_avg(:,1)-5)/BFLow_extime,BFLow_avg(:,2), 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1);
plot((HOHigh_avg(:,1)-5)/HOHigh_extime,HOHigh_avg(:,2), 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1);
plot((HOLow_avg(:,1)-5)/HOLow_extime,HOLow_avg(:,2), 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1);
plot((AXHigh_avg(:,1)-5)/AX_extime,AXHigh_avg(:,2), 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1);
plot((AXLow_avg(:,1)-5)/AX_extime,AXLow_avg(:,2), 'Color', [0 .7 .8], 'linestyle', '--', 'LineWidth', 1);
plot((IQHigh_avg(:,1)-5)/IQHigh_extime,IQHigh_avg(:,2), 'Color', [.6 .4 .8], 'linestyle', '-', 'LineWidth', 1);
plot((IQLow_avg(:,1)-5)/IQLow_extime,IQLow_avg(:,2), 'Color', [.6 .4 .8], 'linestyle', '--', 'LineWidth', 1);
plot((SHHigh_avg(:,1)-5)/SHHigh_extime,SHHigh_avg(:,2), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 2);
plot((SHLow_avg(:,1)-5)/SHLow_extime,SHLow_avg(:,2), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 2);
plot((High_real_avg(:,1)-5)/High_extime,High_real_avg(:,2)/High_real_avg(High_real_avg(:,1)==5,2),'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2);
plot((Low_real_avg(:,1)-5)/Low_extime,Low_real_avg(:,2)/Low_real_avg(Low_real_avg(:,1)==5,2), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2);
% plot(theory_time, exp(-High_avg_k_ex*theory_time), 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2);
% plot(theory_time, exp(-Low_avg_k_ex*theory_time), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2);
axis([0 6 -.02 1.02])
title('Normalized UFP concentration vs. air changes', 'FontSize', 12);
ylabel('Normalized UFP concentration', 'FontSize', 12);
xlabel('Air changes since candle extinguish', 'FontSize', 12);
legend('AAnp high','AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Sham high', 'Sham low', 'Avg high', 'Avg low');
% legend(strcat('AAnp high k=',num2str(AAHigh_ex(1),2)), strcat('AAnp low k=',num2str(AALow_ex(1),2)), ...
%     strcat('AAp high =',num2str(AApHigh_ex(1),2)), strcat('AAp low k=',num2str(AApLow_ex(1),2)), ...
%     strcat('BF high k=',num2str(BFHigh_ex(1),2)), strcat('BF low k=',num2str(BFLow_ex(1),2)), ...
%     strcat('H high k=',num2str(HOHigh_ex(1),2)), strcat('H low k=',num2str(HOLow_ex(1),2)), ...
%     strcat('HX high k=',num2str(AX_ex(1),2)), strcat('HX low k=',num2str(AX_ex(1),2)), ...
%     strcat('IQ high k=',num2str(IQHigh_ex(1),2)), strcat('IQ low k=',num2str(IQLow_ex(1),2)), ...
%     strcat('Sham high k=',num2str(SHHigh_ex(1),2)), strcat('Sham low k=',num2str(SHLow_ex(1),2)), ...
%     strcat('Avg high k=',num2str(High_avg_k_ex,2)), strcat('Avg low k=',num2str(Low_avg_k_ex,2)) ...
% );
hold off

figure('rend','painters','pos',[10 10 700 550])
hold on
plot(AAHigh_avg(:,1)-5,AAHigh_avg(:,2), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1);
plot(AALow_avg(:,1)-5,AALow_avg(:,2), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1);
plot(AApHigh_avg(:,1)-5, AApHigh_avg(:,2), 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1);
plot(AApLow_avg(:,1)-5, AApLow_avg(:,2), 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1);
plot(BFHigh_avg(:,1)-5,BFHigh_avg(:,2),'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1);
plot(BFLow_avg(:,1)-5,BFLow_avg(:,2), 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1);
plot(HOHigh_avg(:,1)-5,HOHigh_avg(:,2),'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1);
plot(HOLow_avg(:,1)-5,HOLow_avg(:,2), 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1);
plot(AXHigh_avg(:,1)-5,AXHigh_avg(:,2),'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1);
plot(AXLow_avg(:,1)-5,AXLow_avg(:,2),'Color', [0 .7 .8], 'linestyle', '--', 'LineWidth', 1);
plot(IQHigh_avg(:,1)-5,IQHigh_avg(:,2),'Color', [.6 .4 .8], 'linestyle', '-', 'LineWidth', 1);
plot(IQLow_avg(:,1)-5,IQLow_avg(:,2), 'Color', [.6 .4 .8], 'linestyle', '--', 'LineWidth', 1);
plot(SHHigh_avg(:,1)-5,SHHigh_avg(:,2),'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 2);
plot(SHLow_avg(:,1)-5,SHLow_avg(:,2), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 2);

plot(High_real_avg(:,1)-5,High_real_avg(:,2)/High_real_avg(High_real_avg(:,1)==5,2),'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2);
plot(Low_real_avg(:,1)-5,Low_real_avg(:,2)/Low_real_avg(Low_real_avg(:,1)==5,2), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2);

% plot(theory_time, exp(-High_avg_k*theory_time), 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2);
% plot(theory_time, exp(-Low_avg_k*theory_time), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2);
axis([0 30 -.02 1.02])
title('Normalized UFP concentration vs. time', 'FontSize', 12);
ylabel('Normalized UFP concentration', 'FontSize', 12);
xlabel('Time since candle extinguish (min)', 'FontSize', 12);
legend('AAnp high','AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Sham high', 'Sham low', 'Avg high', 'Avg low');
% legend(strcat('AAnp high k=',num2str(AAHigh(1),2)), strcat('AAnp low k=',num2str(AALow(1),2)), ...
%     strcat('AAp high k=',num2str(AApHigh(1),2)), strcat('AAp low k=',num2str(AApLow(1),2)), ...
%     strcat('BF high k=',num2str(BFHigh(1),2)), strcat('BF low k=',num2str(BFLow(1),2)), ...
%     strcat('H high k=',num2str(HOHigh(1),2)), strcat('H low k=',num2str(HOLow(1),2)), ...
%     strcat('HX high k=',num2str(AX(1),2)), strcat('HX low k=',num2str(AX(1),2)), ...
%     strcat('IQ high k=',num2str(IQHigh(1),2)), strcat('IQ low k=',num2str(IQLow(1),2)), ...
%     strcat('Sham high k=',num2str(SHHigh(1),2)), strcat('Sham low k=',num2str(SHLow(1),2)), ...
%     strcat('Avg high k=',num2str(High_avg_k,2)), strcat('Avg low k=',num2str(Low_avg_k,2)) ...
% );
hold off