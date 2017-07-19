%AustinAir No Prefilter data; outputs a vector of k values for hi and lo + PR60 values
function [kHi, kLo, PR60] = AANP()
    AANP_CFMhi = 264/880;   %CFM/volume = air changes per minute. NOT actually CFM.
    AANP_CFMlo = 83.2/880;

    %get data from files into matrix
    AANPhi1 = csvread('AANP High 1.dat', 6, 2);
    AANPhi2 = csvread('AANP High 2.dat', 6, 2);
    AANPlo1 = csvread('AANP Low 1.dat', 6, 2);
    AANPlo2 = csvread('AANP Low 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [AANPhi1T,AANPhi1C] = getVec(AANPhi1, [75]);
    [AANPhi2T,AANPhi2C] = getVec(AANPhi2, [75]);
    [AANPlo1T,AANPlo1C] = getVec(AANPlo1, [75]);
    [AANPlo2T,AANPlo2C] = getVec(AANPlo2, [75]);
    
%     hold on
%     plot(AANPhi2T/60-1, AANPhi2C)
%     xlabel('time since candle extinguish (min)')
%     ylabel('concentration (p/cm^3)')
%     title('Austin Air no prefilter raw data')
    %axis([-31 75 0 400000])
    
    %average the 2 high trials and the 2 low trials
    [AANPhiAvgT,AANPhiAvgC] = goodAvg(AANPhi1T, AANPhi1C, AANPhi2T, AANPhi2C, 143);
    [AANPloAvgT,AANPloAvgC] = goodAvg(AANPlo1T, AANPlo1C, AANPlo2T, AANPlo2C, 143);

    %get data of filter effect 'above and beyond the sham filter'
    [ABHi1k,ABHi1PR60] = compareToShamHi(AANPhi1T, AANPhi1C, AANP_CFMhi);
    [ABHi2k,ABHi2PR60] = compareToShamHi(AANPhi2T, AANPhi2C, AANP_CFMhi);
    [ABLo1k,ABLo1PR60] = compareToShamLo(AANPlo1T, AANPlo1C, AANP_CFMlo);
    [ABLo2k,ABLo2PR60] = compareToShamLo(AANPlo2T, AANPlo2C, AANP_CFMlo);

    %% K
    
    %non-normalized k values
    kHi = [findK(AANPhi1C, 2200),findK(AANPhi2C, 2200)];
    kLo = [findK(AANPlo1C, 2300),findK(AANPlo2C, 2500)];

    %k values normalized by ACM
    %kHi = kHi./AANP_CFMhi;
    %kLo = [findK(AANPlo1C, 2300),findK(AANPlo2C, 2300)]./AANP_CFMlo;

    %k values above and beyond sham filter, normalized by ACM
    %kHi = [ABHi1k, ABHi2k];
    %kLo = [ABLo1k, ABLo2k];
    

    %% PR60   
    
    %per cent particle reduction 1 hour from filter being turned on
    %hi1, hi2, lo1, lo2
    PR60 = [perRed(AANPhi1T,AANPhi1C), perRed(AANPhi2T,AANPhi2C), perRed(AANPlo1T,AANPlo1C), perRed(AANPlo2T,AANPlo2C)];

    %PR60 above and beyond sham filter, normalized by ACM
    %hi1, hi2, lo1, lo2
    %PR60 = [ABHi1PR60,ABHi2PR60,ABLo1PR60,ABLo2PR60];
    
    %% PLOT FIT AND STANDARD DEVIATION
    %get standard deviations of k values
    STDhi = std(kHi);
    kHiValue = mean(kHi);
    STDlo = std(kLo);
    kLoValue = mean(kLo);
    
    %get normalized data
    %[NormHiAvgC, NormHiAvgT, ~, NormLoAvgC, NormLoAvgT, ~, ~, ~] = AANPseries()
    %normalize averaged trials
    zeroIndex = find(AANPhiAvgT == 0);
    NormHiAvgC = AANPhiAvgC/AANPhiAvgC(zeroIndex);
    zeroIndex = find(AANPloAvgT == 0);
    NormLoAvgC = AANPloAvgC/AANPloAvgC(zeroIndex);
    
    zeroIndex = find(AANPhi1T == 0);
    NormHi1C = AANPhi1C/AANPhi1C(zeroIndex);
    zeroIndex = find(AANPhi2T == 0);
    NormHi2C = AANPhi2C/AANPhi2C(zeroIndex);
    zeroIndex = find(AANPlo1T == 0);
    NormLo1C = AANPlo1C/AANPlo1C(zeroIndex);
    zeroIndex = find(AANPlo2T == 0);
    NormLo2C = AANPlo2C/AANPlo2C(zeroIndex);
    
    
%     figure('rend', 'painters', 'pos', [10 10 850 550])
%     hold on
%     theoreticalTime = 0:15:4000;
%     %plot data for high setting
%     plot((AANPhi1T(150:5:400)-45)/60,NormHi1C(150:5:400), 'Color', [1 .5 .5], 'linestyle', 'x') 
%     plot((AANPhi2T(150:5:400)-50)/60,NormHi2C(150:5:400), 'Color', [1 .5 .5], 'linestyle', 'o') 
%     %plot fit for high setting
%     plot(theoreticalTime/60, exp(-(kHiValue)*theoreticalTime), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 2)
%     %plot data for low setting
%     plot((AANPlo1T(150:5:400)+60)/60,NormLo1C(150:5:400), 'Color', [1 .5 .5], 'linestyle', '+') 
%     plot((AANPlo2T(150:5:400)+60)/60,NormLo2C(150:5:400), 'Color', [1 .5 .5], 'linestyle', '*')
%     %plot fit for low setting
%     plot(theoreticalTime/60, exp(-(kLoValue)*theoreticalTime), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 2)
%     %get normalized averaged data
%     
%     
%     xlabel('time since extinguish (min)', 'FontSize', 12);
%     ylabel('normalized concentration (particles/cc)', 'FontSize', 12);
%     title('normalized concentration of AA NP, showing decay curve fit', 'FontSize', 12);
%     axis([0 30 0 1])
%     legend('High trial 1', 'High trial 2', 'High fit, k=0.0044\pm 0.0002; R^2=1.00', 'Low trial 1', 'Low trial 2', 'Low fit, k=0.0018\pm 0.00005; R^2=1.00')

    
    %% PLOTTING
    
    %figure
    %plot(AANPhi1T,AANPhi1C, AANPhi2T,AANPhi2C, AANPlo1T,AANPlo1C, AANPlo2T,AANPlo2C)
    %legend('High 1', 'High 2', 'Low 1', 'Low 2')

    %figure
    %plot(AANPhiAvgT,AANPhiAvgC, AANPloAvgT,AANPloAvgC)
    %legend('High Average', 'Low Average')
end