%Box Fan data; outputs a vector of k values for hi and lo + PR60 values
function [kHi, kLo, PR60] = BF()
    BF_CFMhi = 45/880;     %GUESS for air changes per minute. NOT actually CFM.
    BF_CFMlo = 28/880;     %GUESS for air changes per minute. NOT actually CFM.

    %get data from files into matrix
    BFhi1 = csvread('BF High 1.dat', 6, 2);
    BFhi2 = csvread('BF High 2.dat', 6, 2);
    BFlo1 = csvread('BF Low 1.dat', 6, 2);
    BFlo2 = csvread('BF Low 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [BFhi1T,BFhi1C] = getVec(BFhi1, [79]);
    [BFhi2T,BFhi2C] = getVec(BFhi2, [75]);
    [BFlo1T,BFlo1C] = getVec(BFlo1, [74.25]);
    [BFlo2T,BFlo2C] = getVec(BFlo2, [76]);
    
    %average the 2 high trials and the 2 low trials
    [BFhiAvgT,BFhiAvgC] = goodAvg(BFhi1T, BFhi1C, BFhi2T, BFhi2C, 204);
    [BFloAvgT,BFloAvgC] = goodAvg(BFlo1T, BFlo1C, BFlo2T, BFlo2C, 204);
    
    %get data of filter effect 'above and beyond the sham filter'
    %DATA COMING SOON ::)
    
    %% K

    %non-normalized k values
    kHi = [findK(BFhi1C, 3350),findK(BFhi2C, 3300)];
    kLo = [findK(BFlo1C, 3300),findK(BFlo2C, 3800)];

    %k values normalized by CFM
    %kHi = [findK(BFhi1C, 3350),findK(BFhi2C, 3300)]./BF_CFMhi;
    %kLo = [findK(BFlo1C, 3300),findK(BFlo2C, 3800)]./BF_CFMlo;
    
    %k values above and beyond sham filter, normalized by ACM
    %DATA COMING SOON ::)
    
    %% PR60

    %per cent particle reduction 1 hour from filter being turned on
    %hi1, hi2, lo1, lo2
    PR60 = [perRed(BFhi1T,BFhi1C), perRed(BFhi2T,BFhi2C), perRed(BFlo1T,BFlo1C), perRed(BFlo2T,BFlo2C)];
    
    %PR60 above and beyond sham filter, normalized by ACM
    %hi1, hi2, lo1, lo2
    %DATA COMING SOON ::)
    
    %% PLOTTING

    %figure
    %plot(BFhi1T,BFhi1C, BFhi2T,BFhi2C, BFlo1T,BFlo1C, BFlo2T,BFlo2C)
    %legend('High 1', 'High 2', 'Low 1', 'Low 2')

    %figure
    %plot(BFhiAvgT,BFhiAvgC, BFloAvgT,BFloAvgC)
    %legend('High Average', 'Low Average')
end