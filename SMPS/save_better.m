function res = save_better(name, filtime, plot_bool)
T1 = readtable(name);
[l w] = size(T1);
top1 = T1(16:18,1:w);
data1 = transpose(csvread(name, 20, 1, [20 1 106 w-1]));
data3 = transpose(sum(transpose(data1(:,1:74)))/64);
time1 = transpose(5*(-w+2:0)+filtime);
if plot_bool
    figure
    hold on
    plot(time1, data1);
    xlabel('Time');
    ylabel('UFP number/logN');
    title(name);
    size(time1)
    size(data3)
    hold off
end
res = [time1 data1 data3];
end