%Holmes data; outputs a vector of k values for hi, med, and lo + PR60 values
function [kHi, kLo, kMed, PR60] = H()
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
    
    %get data of filter effect 'above and beyond the sham filter'
    %DATA COMING SOON ::)
    
    %% K

    %non-normalized k values
    kHi = [findK(Hhi1C, 2400),findK(Hhi2C, 2300)];
    kLo = [findK(Hlo2C, 2450)];
    kMed = [findK(Hmed2C, 3300)];

    %k values normalized by CFM
    %kHi = [findK(Hhi1C, 2400),findK(Hhi2C, 2300)]./H_CFMhi;
    %kLo = [findK(Hlo2C, 2450)]./H_CFMmed;
    %kMed = [findK(Hmed2C, 3300)]./H_CFMlo;
    
    %k values above and beyond sham filter, normalized by ACM
    %DATA COMING SOON ::)
    
    %% PR60

    %per cent particle reduction 1 hour from filter being turned on
    %hi1, hi2, lo2, med2
    PR60 = [perRed(Hhi1T,Hhi1C), perRed(Hhi2T,Hhi2C), perRed(Hlo2T,Hlo2C), perRed(Hmed2T,Hmed2C)];
    
    %PR60 above and beyond sham filter, normalized by ACM
    %hi1, hi2, lo2, med2
    %DATA COMING SOON ::)
    
    %% PLOTTING

    %figure
    %plot(Hhi1T,Hhi1C, Hhi2T,Hhi2C, Hlo2T,Hlo2C, Hmed2T,Hmed2C)
    %legend('High 1', 'High 2', 'Low 2', 'Med2')

    %figure
    %plot(HhiAvgT,HhiAvgC, Hlo2T,Hlo2C, Hmed2T,Hmed2C)
    %legend('High Average', 'Low', 'Med')
end