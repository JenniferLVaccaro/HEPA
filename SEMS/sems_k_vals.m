function res = sems_k_vals(Filt, plot_bool)
%Filt is a matrix with a time column, all concentration data, and then a
    %column of integrated UFP concentration data
%plot_bool is whether you want it to make a plot of k per % reduction for 
    %some reason
%res is an nx4 matrix for an n+1 column input, where the first element is
    %for UFP

times = Filt(:,1);
runs = 20;  %how many scans we ran
%cut off ufps and bins
cut_times = times(1:runs);
ufps = Filt(1:runs,end-3);
pm1 = Filt(1:runs, end-2);
pm1_1 = Filt(1:runs, end-1);
pm3 = Filt(1:runs,end);
bins = Filt(1:runs,2:end-4);

%calculate k vals
k_bins = find_1_k(cut_times, ufps); %first entry of result will be ufp k value
k_bins = [k_bins; find_1_k(cut_times, pm1);];
k_bins = [k_bins; find_1_k(cut_times, pm1_1);];
k_bins = [k_bins; find_1_k(cut_times, pm3);];
[l w] = size(bins);
for i=1:w
    new_k = find_1_k(cut_times, bins(:,i));
    k_bins = [k_bins; new_k];
end

%if plot==true then plot some stuff
if plot_bool
    figure
    hold on
    bar(k_bins(:,3));
    title('K/% decrease');
    xlabel('Bins (UFP, smallest to largest)');
    ylabel('K value (min^{-1})');
    hold off
end
%set the results
res = k_bins;
end