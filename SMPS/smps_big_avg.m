function res = smps_big_avg(d1, d2, d3, d4, d5, d6, plot_bool)
%Align the time data
d1(:,1) = d1(:,1)-mod(d1(1,1),5);
d2(:,1) = d2(:,1)-mod(d2(1,1),5);
d3(:,1) = d3(:,1)-mod(d3(1,1),5);
d4(:,1) = d4(:,1)-mod(d4(1,1),5);
d5(:,1) = d5(:,1)-mod(d5(1,1),5);
d6(:,1) = d6(:,1)-mod(d6(1,1),5);
%Cut off the extra
start = max([d1(1,1) d2(1,1) d3(1,1) d4(1,1) d5(1,1) d6(1,1)]);
stop = min([d1(end,1) d2(end,1) d3(end,1) d4(end,1) d5(end,1) d6(end,1)]);
times = transpose(start:5:stop);
dee1 = d1(:,2);
dee2 = d2(:,2);
dee3 = d3(:,2);
dee4 = d4(:,2);
dee5 = d5(:,2);
dee6 = d6(:,2);
dee1a = dee1(start<=d1(:,1)&d1(:,1)<=stop); 
dee2a = dee2(start<=d2(:,1)&d2(:,1)<=stop);
dee3a = dee3(start<=d3(:,1)&d3(:,1)<=stop); 
dee4a = dee4(start<=d4(:,1)&d4(:,1)<=stop);
dee5a = dee5(start<=d5(:,1)&d5(:,1)<=stop); 
dee6a = dee6(start<=d6(:,1)&d6(:,1)<=stop);
%normalize the results
norm1 = dee1a/dee1a(times==5);
norm2 = dee2a/dee2a(times==5);
norm3 = dee3a/dee3a(times==5);
norm4 = dee4a/dee4a(times==5);
norm5 = dee5a/dee5a(times==5);
norm6 = dee6a/dee6a(times==5);
dee_avg = .5*(norm1+norm2+norm3+norm4+norm5+norm6);
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

