function [k_imp, p_imp, r2_imp, bins_avg, k_bins, p_bins, r2_bins, p_cfm] = semsemsems(name, b4filt, scantime, cfm)
    %Inputs: name = SEMS file name
            %b4filt = time (minutes) before filter is turned on
            %scantime = how long one scan takes, in minutes
    %Function: Makes several useful plots
    
    conc = csvread(name, 56, 92);
    [l w] = size(conc);
    bins = csvread(name, 56, 21, [56, 21, 56, 91]);
    times = transpose(0:scantime:scantime*l-1)-b4filt;            %where l = however many scans we did
    ufp = transpose(sum(transpose(conc(:,1:45))));
    pm1 = transpose(sum(transpose(conc(:,1:end))));
    pm1_1 = transpose(sum(transpose(conc(:,46:end))));
    pm3 = transpose(sum(transpose(conc(:,61:end))));

    conc_avg = [transpose(downsample(transpose(conc(:,1:end-2)), 3, 0) + downsample(transpose(conc(:,1:end-2)), 3, 1) +downsample(transpose(conc), 3, 2))/3 (conc(:,end-1)+conc(:,end))*.5];
    bins_avg = [transpose(downsample(transpose(bins(:,1:end-2)),3,1)) bins(end)];
    % PColor plot
    figure('rend', 'painters', 'pos', [10 10 700 550])
    hold on
    %h = pcolor(times, bins, transpose(conc));
    h = pcolor(times(1:end-2), bins, transpose(conc(1:end-2,:)));
    colorbar
    set(h, 'EdgeColor', 'none')
    set(gca,'yscale', 'log')
    set(gca,'TickDir','out')
    axis([times(1) times(end-2) bins(1) bins(end)])
    %axis([times(1) times(end-2) bins(1) 1000])
    xlabel('time (min)', 'FontSize', 14);
    ylabel('particle diameter (nm)', 'FontSize', 14);
    hold off
    
    %All of the bin concentrations, including UFP, vs. time
    figure('rend', 'painters', 'pos', [10 10 700 550])
    hold on
    %semilogy(times, conc);
    semilogy(times(1:end-2), pm1(1:end-2), 'LineStyle', '-', 'LineWidth', 2, 'Color', [0 0 0]);
    semilogy(times(1:end-2), ufp(1:end-2), 'LineStyle', '-', 'LineWidth', 2, 'Color', [1 0 0]);
    set(gca,'yscale','log')
    xlabel('time (min)', 'FontSize', 14);
    ylabel('concentration (particles/cm^3)', 'FontSize', 14);
    legend('PM1', 'UFP');
    axis([times(1) times(end-2) 8e4 1e7])
    hold off

    filt = [times conc ufp pm1 pm1_1 pm3];
    filt2 = [times conc_avg ufp pm1 pm1_1 pm3];
    %Calculate the k values, initial concentration, % reduction and R^2 values
    %yolo = sems_k_vals(filt(floor(b4filt/scantime):floor(b4filt/scantime+cfm*scantime),:), false);
    yolo2 = sems_k_vals(filt2(floor(b4filt/scantime):end,:), false);
    p_cfm = transpose(1-filt2(ceil(b4filt/scantime)+ceil(1/(cfm*scantime)),2:end-4)./filt2(ceil(b4filt/scantime),2:end-4));
    size(p_cfm);
    %Plot K value vs. bin size
%     figure
%     hold on
%     semilogx(bins, yolo(2:end,1));
%     semilogx([10 100], [yolo(1,1) yolo(1,1)], '--');
%     set(gca,'xscale','log')
%     legend('by bin', 'ufp');
%     title('K vals w.r.t. bins');
%     hold off
    
    %Plot initial concentration, % reduction and R^2 values
%     figure
%     hold on
%     ps = yolo(5:end,3);
%     r2s = yolo(5:end,4);
%     %semilogx(bins(r2s>.15), ps(r2s>.15), 'k');
%     %semilogx([10 100], [yolo(1,3) yolo(1,3)], '--');
%     semilogx(bins, r2s, 'r');
%     semilogx(bins, yolo(5:end,2)/max(yolo(5:end,2)), 'g');
%     set(gca,'xscale','log','yscale','log')
%     title(strcat(name,' % reduction after a half hour w.r.t. bins'));
%     legend('% reduction by bin', '% ufp reduction', 'R^2 by bin', 'initial val');
%     hold off
%     
    %Waterfall plot calls an external function
    %waterplot(times, bins, conc);
    
    %get smoothed curves by downsampling k values and PR30
    
%     plot(filt2(ceil(b4filt/scantime):end,1),filt2(ceil(b4filt/scantime):end,end-3)/filt2(ceil(b4filt/scantime),end-3), 'rx');
%     plot(filt2(floor(b4filt/scantime):end,1),exp(-1*yolo2(1,1)*filt2(floor(b4filt/scantime):end,1)), 'r-');
    %plot(filt2(ceil(b4filt/scantime):end,1)+1.5,filt2(ceil(b4filt/scantime):end,end-2)/filt2(ceil(b4filt/scantime),end-2), 'bx');
    %plot(filt2(ceil(b4filt/scantime)+1:end,1),exp(-1*yolo2(2,1)*filt2(ceil(b4filt/scantime)+1:end,1)), 'b-');
%     plot(filt2(ceil(b4filt/scantime):end,1),filt2(ceil(b4filt/scantime):end,end-1)/filt2(ceil(b4filt/scantime),end-1), 'gx');
%     plot(filt2(floor(b4filt/scantime):end,1),exp(-1*yolo2(3,1)*filt2(floor(b4filt/scantime):end,1)), 'g-');
%     plot(filt2(ceil(b4filt/scantime):end,1),filt2(ceil(b4filt/scantime):end,end)/filt2(ceil(b4filt/scantime),end), 'kx');
%     plot(filt2(floor(b4filt/scantime):end,1),exp(-1*yolo2(4,1)*filt2(floor(b4filt/scantime):end,1)), 'k-');
%     legend('ufp','ufp fit','PM1','PM1 fit', 'PM_{1-1}','PM_{1-1} fit','PM_{UFP}','PM_{UFP} fit');
    
   k_imp = yolo2(1:4,1);
   p_imp = yolo2(1:4,3);
   r2_imp = yolo2(1:4,4);
   k_bins = yolo2(5:end,1);
   size(bins_avg);
   size(k_bins);
   p_bins = yolo2(5:end,3);
   r2_bins = yolo2(5:end,4);
%     [smoothBins, smoothK, smoothPRs] = smoother(bins, yolo(2:end,1), yolo(2:end,3));
%     
%     k_mean = mean(yolo(2:end,1));
%     nanFinder = isnan(yolo(:,1));
%     if sum(nanFinder)
%         k_mean = mean(yolo(nanFinder==0));
%     end
%     k_UFP = yolo(1,1);
end