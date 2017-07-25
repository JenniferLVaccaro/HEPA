function res = sems_k_vals(Filt, plot_bool)
times = Filt(:,1);
%find times after decrease
cutoff = -1*floor(times(1)/5)+2;

%cutoff ufps and bins
cut_times = times(cutoff:cutoff+7);
ufps = Filt(cutoff:cutoff+7,end);
bins = Filt(cutoff:cutoff+7,2:end-1);
%calculate k vals
k_bins = find_1_k(cut_times, ufps, false); %first entry of result will be ufp k value
[l w] = size(bins);
for i=1:w
    new_k = find_1_k(cut_times, bins(:,i), false);
    k_bins = [k_bins; new_k];
end
%if plot==true then plot some stuff
if plot_bool
    figure
    hold on
    bar(k_bins(:,3));
    title('K \% decrease');
    xlabel('Bins (UFP, smallest to largest)');
    ylabel('K value (min^{-1})');
    hold off
end
%set the results
res = k_bins;
end