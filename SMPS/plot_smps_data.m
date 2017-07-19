filename = 'High 2.csv';
zerotime = 42;

T1 = readtable(filename);
top1 = T1(16:18,1:23);
data1 = csvread(filename, 20, 1, [20 1 106 22]);
% size(bins)
% size(data1)
time = 5*(1:length(data1(1,:)))-40;
data2 = [sum(data1(1:5,:));sum(data1(6:25,:));sum(data1(26:87,:))];
data3 = sum(data1(1:74,:));
size(data3)
% plot(time, data1)
% xlabel('Time since extinguishing');
% ylabel('Bin concentration');
% figure
% plot(time, data2)
% xlabel('Time since extinguishing');
% ylabel('Bin concentration');
% legend('1-5','6-25','26-87');
figure
plot(time, data1(1:74,:))
xlabel('Time since extinguishing');
ylabel('Bin concentration');
legend('UFP');
title(filename);

% bins = csvread('High 1.csv', 20, 1, [20 1 107 1])
% names1 = T1(16:19, :);
% T2 = T1(20:106,:);
% vals1 = table2cell(T2);
% vals2 = cell2mat(vals1);
% bins = vals1(:,1);
% 
% isa(vals1, 'cell')
% % for i=1:L
% %     for j=1:W
% %         vals1(i,j) = cell2num(vals1(i,j))
% %     end
% % end

