%Holmes data; outputs normalized time and concentration vectors for plotting
function [HhiAvgC, HhiAvgT, HhiAvgAC, Hmed2C, Hmed2T, HmedAC, Hlo2C, Hlo2T, HloAC, kAChi, kACmed, kAClo, HhiPR1AC, HmedPR1AC, HloPR1AC] = Hseries()
    H_CFMhi = 94.4/880;  %GUESS for air changes per minute. NOT actually CFM.
    H_CFMmed = 80/880;  %GUESS for air changes per minute. NOT actually CFM.
    H_CFMlo = 53.2/880;   %GUESS for air changes per minute. NOT actually CFM.

    %get data from files into matrix
    Hhi1 = csvread('H High 1.dat', 6, 2);
    Hhi2 = csvread('H High 2.dat', 6, 2);
    Hlo2 = csvread('H Low 2.dat', 6, 2);
    Hmed2 = csvread('H Medium 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [Hhi1T,Hhi1C] = getVec(Hhi1, [75]);
    [Hhi2T,Hhi2C] = getVec(Hhi2, [79]);
    [Hlo2T,Hlo2C] = getVec(Hlo2, [79]);
    [Hmed2T,Hmed2C] = getVec(Hmed2, [91]);
    
    %average the 2 high trials (low and medium are single)
    [HhiAvgT,HhiAvgC] = goodAvg(Hhi1T, Hhi1C, Hhi2T, Hhi2C, 148);
    
    %normalize averaged trials
    zeroIndex = find(HhiAvgT == 0);
    HhiAvgC = HhiAvgC/HhiAvgC(zeroIndex);
    zeroIndex = find(Hmed2T == 0);
    Hmed2C = Hmed2C/Hmed2C(zeroIndex);
    zeroIndex = find(Hlo2T == 0);
    Hlo2C = Hlo2C/Hlo2C(zeroIndex);

    %% AIR CHANGE VECTORS
    
    ACShi = H_CFMhi/60;  %air changes per second
    ACSmed = H_CFMmed/60;  %air changes per second
    ACSlo = H_CFMlo/60;  %air changes per second
    HhiAvgAC =HhiAvgT*ACShi;
    HmedAC =Hmed2T*ACShi;
    HloAC = Hlo2T*ACSlo;

    %% GET AC-NORMALIZED K VALUES

    kAChi = [findK(HhiAvgC, 2400)]./ACShi;
    kACmed = [findK(Hmed2C, 3300)]./ACSmed;
    kAClo = [findK(Hlo2C, 2450)]./ACSlo;
    
    
    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(HhiAvgAC > 0.9999);
    sampleConc = HhiAvgC(sampleIndex(1));

    HhiPR1AC = 1 - sampleConc;
    
    %find low concentration at 1AC
    sampleIndex = find(HloAC > 0.9999);
    sampleConc = Hlo2C(sampleIndex(1));

    HloPR1AC = 1 - sampleConc; 
    
    %find med concentration at 1AC
    sampleIndex = find(HmedAC > 0.9999);
    sampleConc = Hmed2C(sampleIndex(1));

    HmedPR1AC = 1 - sampleConc;
    
    
    %% CHOP
    zeroIndex = find(HhiAvgT == 0);
    HhiAvgC = HhiAvgC(zeroIndex:zeroIndex + 220);
    HhiAvgAC = HhiAvgAC(zeroIndex:zeroIndex + 220);
    HhiAvgT = HhiAvgT(zeroIndex:zeroIndex + 220);
    zeroIndex = find(Hmed2T == 0);
    Hmed2C = Hmed2C(zeroIndex:zeroIndex + 220);
    HmedAC = HmedAC(zeroIndex:zeroIndex + 220);
    Hmed2T = Hmed2T(zeroIndex:zeroIndex + 220);
    zeroIndex = find(Hlo2T == 0);
    Hlo2C = Hlo2C(zeroIndex:zeroIndex + 220);
    HloAC = HloAC(zeroIndex:zeroIndex + 220);
    Hlo2T = Hlo2T(zeroIndex:zeroIndex + 220);
    
    
    %% PLOTTING

    %figure
    %plot(HhiAvgT,HhiAvgC, Hlo2T,Hlo2C, Hmed2T,Hmed2C)
    %legend('High Average', 'Low', 'Med')

    %figure
    %plot(HhiAvgAC,HhiAvgC, HloAC,Hlo2C, HmedAC,Hmed2C)
    %legend('High Average', 'Low', 'Med')
    %axis([0 10 0 1.2])
end