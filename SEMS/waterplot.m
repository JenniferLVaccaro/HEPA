    function waterplot(times, bins, concentrations)
        figure('rend', 'painters', 'pos', [10 10 700 550])
        waterfall(log(bins), times, log(concentrations))
        set(gca,'XTick',[log(0), log(10), log(25), log(100), log(250), log(1000)])
        set(gca,'XTickLabel',{'0', '10', '25', '100', '250', '1000'});
        set(gca,'ZTick',[log(10000), log(100000), log(1000000), log(10000000)])
        set(gca,'ZTickLabel',{'1e4', '1e5', '1e6', '1e7'});
        xlabel('particle diameter (nm)')
        ylabel('time (min)')
        zlabel('concentration (p/cc)')
    end
