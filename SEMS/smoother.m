function [smoothBins, smoothKs, smoothPRs] = smoother(bins, kvals, PRs)
%outputs are a list of bins by geometric mean particle size; and list of averaged k vals.
    
    %downsample bins and kvals by 2 after adding an extra term to make it
    %evenly divisible. this term is the same as the last one.
            %bins(72) = mean([bins(70) bins(71)])
    bins(72) = bins(71);
    bTemp(:,1) = downsample(bins,2,0);
    bTemp(:,2) = downsample(bins,2,1);
    %bTemp(:,3) = downsample(bins,3,2);

            %kvals(72) = mean([kvals(70) kvals(71)]);
    kvals(72) = kvals(71);
    kTemp(:,1) = downsample(kvals,2,0);
    kTemp(:,2) = downsample(kvals,2,1);
    %kTemp(:,3) = downsample(kvals,3,2);
    
    PRs(72) = PRs(71);
    PRTemp(:,1) = downsample(PRs,2,0);
    PRTemp(:,2) = downsample(PRs,2,1);
    
    smoothBins = zeros(36,1);
    smoothKs = zeros(36,1);
    smoothPRs = zeros(36,1);
    
    %average the phase-shifted samples to smooth
    for i=1:36
        smoothBins(i) = geomean(bTemp(i,:));
        smoothKs(i) = mean(kTemp(i,:));
        smoothPRs(i) = mean(PRTemp(i,:));
    end
    
    %hold on
    %plot(smoothBins, smoothPRs)
    %axis([0, 1000, 0, 1])
end