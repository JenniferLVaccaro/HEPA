function res = smps_avg(d1, d2, plot_bool)
%Align the time data
d1(:,1) = d1(:,1)-mod(d1(1,1),5);
d2(:,1) = d2(:,1)-mod(d2(1,1),5);
%Cut off the extra
start = max(d1(1,1),d2(1,1));
stop = min(d1(end,1),d2(end,1));
times = transpose(start:5:stop);
dee1 = d1(:,2);
dee2 = d2(:,2);
dee1a = dee1(start<=d1(:,1)&d1(:,1)<=stop); 
dee2a = dee2(start<=d2(:,1)&d2(:,1)<=stop);
%normalize the results
norm1 = dee1a/dee1a(times==5);
norm2 = dee2a/dee2a(times==5);
dee_avg = .5*(norm1+norm2);
%average the results
if plot_bool
    figure
    hold on
    plot(times, norm1, 'k');
    plot(times, norm2, 'g');
    plot(times, dee_avg, 'b');
    title('Normalized Concentration and Avg');
    ylabel('Concentration (normalized to t=5)');
    xlabel('Time (minutes)');
    legend('data1','data2','avg');
    hold off
end
res = [times dee_avg];
end
