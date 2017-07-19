%Sham filter data; outputs a vector of k values for hi and lo + PR60 values
function [kHi, kLo, PR60] = SHAM()
    SHAM_CFMhi = 250/880;
    SHAM_CFMlo = 78/880;

    SHAMhi1 = csvread('SHAM High 1.dat', 6, 2);
    SHAMhi2 = csvread('SHAM High 2.dat', 6, 2);
    SHAMlo1 = csvread('SHAM Low 1.dat', 6, 2);
    SHAMlo2 = csvread('SHAM Low 2.dat', 6, 2);

    [SHAMhi1T,SHAMhi1C] = getVec(SHAMhi1, [75]);
    [SHAMhi2T,SHAMhi2C] = getVec(SHAMhi2, [75]);
    [SHAMlo1T,SHAMlo1C] = getVec(SHAMlo1, [79]);
    [SHAMlo2T,SHAMlo2C] = getVec(SHAMlo2, [75]);

    SHAMhiAvgC = (SHAMhi1C + SHAMhi2C)/2;
    SHAMhiAvgT = (SHAMhi1T + SHAMhi2T)/2;
    SHAMloAvgC = (SHAMlo1C + SHAMlo2C)/2;
    SHAMloAvgT = (SHAMlo1T + SHAMlo2T)/2;

    %% K
    
    %non-normalized k values
    kHi = [findK(SHAMhi1C, 3800),findK(SHAMhi2C, 3300)];
    kLo = [findK(SHAMlo1C, 3400),findK(SHAMlo2C, 3350)];

    %k values normalized by CFM
    %kHi = [findK(SHAMhi1C, 2300),findK(SHAMhi2C, 3300)]./SHAM_CFMhi;
    %kLo = [findK(SHAMlo1C, 3400),findK(SHAMlo2C, 3350)]./SHAM_CFMlo;
    
    %% PR60

    %per cent particle reduction 1 hour from filter being turned on
    %hi1, hi2, lo1, lo2
    PR60 = [perRed(SHAMhi1T,SHAMhi1C), perRed(SHAMhi2T,SHAMhi2C), perRed(SHAMlo1T,SHAMlo1C), perRed(SHAMlo2T,SHAMlo2C)];

    
    
    %% PLOTTING
    
    %figure
    %plot(SHAMhi1T,SHAMhi1C, SHAMhi2T,SHAMhi2C, SHAMlo1T,SHAMlo1C, SHAMlo2T,SHAMlo2C)
    %plot(SHAMhi1T,NormHi1C, SHAMhi2T,NormHi2C, SHAMlo1T,NormLo1C, SHAMlo2T,NormLo2C)
    %legend('High 1', 'High 2', 'Low 1', 'Low 2')

    %figure
    %plot(SHAMhiAvgT,SHAMhiAvgC, SHAMloAvgT,SHAMloAvgC)
    %plot(SHAMhiAvgT,NormHiAvgC, SHAMloAvgT,NormLoAvgC)
    %legend('High Average', 'Low Average')
end