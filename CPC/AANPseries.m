%AustinAir No Prefilter data; outputs normalized time and concentration vectors for plotting
function [AANPhiAvgC, AANPhiAvgT, AANPhiAvgAC, AANPloAvgC, AANPloAvgT, AANPloAvgAC, kAChi, kAClo, AANPhiPR1AC, AANPloPR1AC] = AANPseries()
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
    
    %average the 2 high trials and the 2 low trials
    [AANPhiAvgT,AANPhiAvgC] = goodAvg(AANPhi1T, AANPhi1C, AANPhi2T, AANPhi2C, 143);
    [AANPloAvgT,AANPloAvgC] = goodAvg(AANPlo1T, AANPlo1C, AANPlo2T, AANPlo2C, 143);

    %normalize averaged trials
    zeroIndex = find(AANPhiAvgT == 0);
    AANPhiAvgC = AANPhiAvgC/AANPhiAvgC(zeroIndex);
    zeroIndex = find(AANPloAvgT == 0);
    AANPloAvgC = AANPloAvgC/AANPloAvgC(zeroIndex);

    %% AIR CHANGE VECTORS

    ACShi = AANP_CFMhi/60;  %air changes per second
    ACSlo = AANP_CFMlo/60;  %air changes per second
    AANPhiAvgAC = AANPhiAvgT*ACShi;
    AANPloAvgAC = AANPloAvgT*ACSlo;

    %% GET AC-NORMALIZED K VALUES

    kAChi = [findK(AANPhiAvgC, 2200)]./ACShi;
    kAClo = [findK(AANPloAvgC, 2300)]./ACSlo;
    
    
    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(AANPhiAvgAC > 0.9999);
    sampleConc = AANPhiAvgC(sampleIndex(1));

    AANPhiPR1AC = 1 - sampleConc;
    
    %find low concentration at 1AC
    sampleIndex = find(AANPloAvgAC > 0.9999);
    sampleConc = AANPloAvgC(sampleIndex(1));

    AANPloPR1AC = 1 - sampleConc;

    
    %% CHOP
    zeroIndex = find(AANPhiAvgT == 0);
    AANPhiAvgC = AANPhiAvgC(zeroIndex:zeroIndex + 220);
    AANPhiAvgAC = AANPhiAvgAC(zeroIndex:zeroIndex + 220);
    AANPhiAvgT = AANPhiAvgT(zeroIndex:zeroIndex + 220);
    zeroIndex = find(AANPloAvgT == 0);
    AANPloAvgC = AANPloAvgC(zeroIndex:zeroIndex + 220);
    AANPloAvgAC = AANPloAvgAC(zeroIndex:zeroIndex + 220);
    AANPloAvgT = AANPloAvgT(zeroIndex:zeroIndex + 220);
    
    
    %% PLOTTING
    
    %figure
    %plot(AANPhiAvgT,AANPhiAvgC, AANPloAvgT,AANPloAvgC)
    %legend('High Average', 'Low Average')

    %figure
    %plot(AANPhiAvgAC,AANPhiAvgC, AANPloAvgAC,AANPloAvgC)
    %legend('High Average', 'Low Average')
    %axis([0 10 0 1.2])
end