function semsemsems(name, b4filt, scantime)
    %Inputs: name = SEMS file name
            %b4filt = time (minutes) before filter is turned on
            %scantime = how long one scan takes, in minutes
    %Function: Makes several useful plots
    
    conc = csvread(name, 56, 92);
    [l w] = size(conc);
    bins = csvread(name, 56, 21, [56, 21, 56, 91]);
    times = transpose(0:scantime:scantime*l-1)-b4filt;            %where l = however many scans we did
    ufp = transpose(sum(transpose(conc(:,1:45))));
    size(times);
    size(bins);
    size(conc);
    
    % PColor plot
%     figure
%     hold on
%     pcolor(times, bins, transpose(conc));
%     set(gca,'yscale', 'log')
%     title('So many bins');
%     hold off
    
    %All of the bin concentrations, including UFP, vs. time
    figure
    hold on
    semilogy(times, conc);
    semilogy(times, ufp, 'k');
    set(gca,'yscale','log')
    title('UFP w.r.t. time');
    hold off
    filt = [times conc ufp];
    
    %Calculate the k values, initial concentration, % reduction and R^2 values
    yolo = sems_k_vals(filt(floor(b4filt/scantime):end,:), false);
    
    %Plot K value vs. bin size
    figure
    hold on
    semilogx(bins, yolo(2:end,1));
    semilogx([10 100], [yolo(1,1) yolo(1,1)], '--');
    set(gca,'xscale','log')
    legend('by bin', 'ufp');
    title('K vals w.r.t. bins');
    hold off
    
    %Plot initial concentration, % reduction and R^2 values
    figure
    hold on
    ps = yolo(2:end,3);
    r2s = yolo(2:end,4);
    semilogx(bins(r2s>.15), ps(r2s>.15), 'k');
    semilogx([10 100], [yolo(1,3) yolo(1,3)], '--');
    semilogx(bins, r2s, 'r');
    semilogx(bins, yolo(2:end,2)/max(yolo(2:end,2)), 'g');
    set(gca,'xscale','log')
    title('% reduction after a half hour w.r.t. bins');
    legend('% reduction by bin', '% ufp reduction', 'R^2 by bin', 'initial val');
    hold off
    
    %Waterfall plot calls an external function
    %waterplot(times, bins, conc);
end