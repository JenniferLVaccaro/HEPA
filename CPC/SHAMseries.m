%Sham filter data; outputs a vector of k values for hi and lo + PR60 values
function [SHAMhiAvgC, SHAMhiAvgT, SHAMhiAvgAC, SHAMloAvgC, SHAMloAvgT, SHAMloAvgAC, kAChi, kAClo, SHAMhiPR1AC, SHAMloPR1AC] = SHAMseries()
    SHAM_CFMhi = 250/880;   %CFM/volume = air changes per minute. NOT actually CFM.
    SHAM_CFMlo = 78/880;

    SHAMhi1 = csvread('SHAM High 1.dat', 6, 2);
    SHAMhi2 = csvread('SHAM High 2.dat', 6, 2);
    SHAMlo1 = csvread('SHAM Low 1.dat', 6, 2);
    SHAMlo2 = csvread('SHAM Low 2.dat', 6, 2);

    [SHAMhi1T,SHAMhi1C] = getVec(SHAMhi1, [75]);
    [SHAMhi2T,SHAMhi2C] = getVec(SHAMhi2, [75]);
    [SHAMlo1T,SHAMlo1C] = getVec(SHAMlo1, [79]);
    [SHAMlo2T,SHAMlo2C] = getVec(SHAMlo2, [75]);

    %average the 2 high trials and the 2 low trials
    [SHAMhiAvgT,SHAMhiAvgC] = goodAvg(SHAMhi1T, SHAMhi1C, SHAMhi2T, SHAMhi2C, 202);
    [SHAMloAvgT,SHAMloAvgC] = goodAvg(SHAMlo1T, SHAMlo1C, SHAMlo2T, SHAMlo2C, 201);
    
    %normalize averaged trials
    zeroIndex = find(SHAMhiAvgT == 0);
    SHAMhiAvgC = SHAMhiAvgC/SHAMhiAvgC(zeroIndex);
    zeroIndex = find(SHAMloAvgT == 0);
    SHAMloAvgC = SHAMloAvgC/SHAMloAvgC(zeroIndex); 
    
    %% AIR CHANGE VECTORS
    
    ACShi = SHAM_CFMhi/60;  %air changes per second
    ACSlo = SHAM_CFMlo/60;  %air changes per second
    SHAMhiAvgAC = SHAMhiAvgT*ACShi;
    SHAMloAvgAC = SHAMloAvgT*ACSlo;

    %% GET AC-NORMALIZED K VALUES

    kAChi = [findK(SHAMhiAvgC, 3100)]./ACShi;
    kAClo = [findK(SHAMloAvgC, 3300)]./ACSlo;
    
    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(SHAMhiAvgAC > 0.9999);
    sampleConc = SHAMhiAvgC(sampleIndex(1));

    SHAMhiPR1AC = 1 - sampleConc;
    
    %find low concentration at 1AC
    sampleIndex = find(SHAMloAvgAC > 0.9999);
    sampleConc = SHAMloAvgC(sampleIndex(1));

    SHAMloPR1AC = 1 - sampleConc; 
    
    

    
    %% PLOTTING

    %figure
    %plot(SHAMhiAvgT,SHAMhiAvgC, SHAMloAvgT,SHAMloAvgC)
    %legend('High Average', 'Low Average')
    
    %figure
    %plot(SHAMhiAvgAC,SHAMhiAvgC, SHAMloAvgAC,SHAMloAvgC)
    %legend('High Average', 'Low Average')
    %axis([0 10 0 1.2])
    
    %% PLOT FIT AND STANDARD DEVIATION
    %non-normalized k values
    kHi = [findK(SHAMhi1C, 3800),findK(SHAMhi2C, 3300)];
    kLo = [findK(SHAMlo1C, 3400),findK(SHAMlo2C, 3350)];
    %get standard deviations of k values
    STDhi = std(kHi);
    kHiValue = (findK(SHAMhiAvgC, 3100));
    STDlo = std(kLo);
    kLoValue = (findK(SHAMloAvgC, 3300));
    
    %get normalized data
    %[NormHiAvgC, NormHiAvgT, ~, NormLoAvgC, NormLoAvgT, ~, ~, ~] = AANPseries()
    %normalize averaged trials
    zeroIndex = find(SHAMhiAvgT == 0);
    NormHiAvgC = SHAMhiAvgC/SHAMhiAvgC(zeroIndex);
    zeroIndex = find(SHAMloAvgT == 0);
    NormLoAvgC = SHAMloAvgC/SHAMloAvgC(zeroIndex);
    
    zeroIndex = find(SHAMhi1T == 0);
    NormHi1C = SHAMhi1C/SHAMhi1C(zeroIndex);
    zeroIndex = find(SHAMhi2T == 0);
    NormHi2C = SHAMhi2C/SHAMhi2C(zeroIndex);
    zeroIndex = find(SHAMlo1T == 0);
    NormLo1C = SHAMlo1C/SHAMlo1C(zeroIndex);
    zeroIndex = find(SHAMlo2T == 0);
    NormLo2C = SHAMlo2C/SHAMlo2C(zeroIndex);
    
    
%     hold on
%     theoreticalTime = 0:15:4000;
%     %plot data for high setting
%     plot((SHAMhi1T(150:5:400))/60,NormHi1C(150:5:400), 'Color', [.5 .5 .5], 'linestyle', 'x')
%     plot((SHAMhi2T(150:5:400))/60,NormHi2C(150:5:400), 'Color', [.5 .5 .5], 'linestyle', 'o')
%     %plot fit for Sham high 
%     plot(theoreticalTime/60, exp(-(kHiValue)*theoreticalTime), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 2)
%     %plot data for low setting
%     plot((SHAMlo1T(150:5:400))/60,NormLo1C(150:5:400), 'Color', [.5 .5 .5], 'linestyle', '+')
%     plot((SHAMlo2T(150:5:400))/60,NormLo2C(150:5:400), 'Color', [.5 .5 .5], 'linestyle', '*')
%     %plot fit for Sham low 
%     plot(theoreticalTime/60, exp(-(kLoValue)*theoreticalTime), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 2)
%     
%     
%     %plot((SHAMhiAvgT(150:5:400))/60,NormHiAvgC(150:5:400), 'g',(SHAMloAvgT(150:5:400))/60,NormLoAvgC(150:5:400), 'y')
%     xlabel('Time since extinguish (min)', 'FontSize', 12);
%     ylabel('Normalized PNC', 'FontSize', 12);
%     title('Normalized PNC of Austin Air and Sham with fit', 'FontSize', 12);
%     axis([0 30 0 1])
%     legend('AAnp high trial 1', 'AAnp high trial 2', 'AAnp high fit, k=0.0044\pm 0.0002; R^2=1.00', 'AAnp low trial 1', 'AAnp low trial 2', 'AAnp low fit, k=0.0018\pm 0.00005; R^2=1.00', 'Sham high trial 1', 'Sham high trial 2','Sham high fit, k=0.0011\pm 0.0003; R^2=0.99', 'Sham low trial 1', 'Sham low trial 2', 'Sham low fit, k=0.00098\pm 0.00003; R^2=0.99')


    %% CHOP
    zeroIndex = find(SHAMhiAvgT == 0);
    SHAMhiAvgC = SHAMhiAvgC(zeroIndex:zeroIndex + 220);
    SHAMhiAvgAC = SHAMhiAvgAC(zeroIndex:zeroIndex + 220);
    SHAMhiAvgT = SHAMhiAvgT(zeroIndex:zeroIndex + 220);
    zeroIndex = find(SHAMloAvgT == 0);
    SHAMloAvgC = SHAMloAvgC(zeroIndex:zeroIndex + 220); 
    SHAMloAvgAC = SHAMloAvgAC(zeroIndex:zeroIndex + 220); 
    SHAMloAvgT = SHAMloAvgT(zeroIndex:zeroIndex + 220); 
end