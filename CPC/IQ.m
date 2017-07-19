%IQ Air data; outputs a vector of k values for hi and lo + PR60 values
%BUT THESE K VALUES LOOK AWFUL!!
function [kHi, kLo, PR60] = IQ()
    IQ_CFMhi = 309.9/880; %CFM/volume = air changes per minute. NOT actually CFM.
    IQ_CFMlo = 75/880;

    %get data from files into matrix
    IQhi1 = csvread('IQ High 1.dat', 6, 2);
    IQhi2 = csvread('IQ High 2.dat', 6, 2);
    IQlo1 = csvread('IQ Low 1.dat', 6, 2);
    IQlo2 = csvread('IQ Low 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [IQhi1T,IQhi1C] = getVec(IQhi1, [77]);
    [IQhi2T,IQhi2C] = getVec(IQhi2, [78]);
    [IQlo1T,IQlo1C] = getVec(IQlo1, [75]);
    [IQlo2T,IQlo2C] = getVec(IQlo2, [86]);
    
    %average the 2 high trials and the 2 low trials
    [IQhiAvgT,IQhiAvgC] = goodAvg(IQhi1T, IQhi1C, IQhi2T, IQhi2C, 206);
    [IQloAvgT,IQloAvgC] = goodAvg(IQlo1T, IQlo1C, IQlo2T, IQlo2C, 203);

    %get data of filter effect 'above and beyond the sham filter'
    [ABHi1k,ABHi1PR60] = compareToShamHi(IQhi1T, IQhi1C, IQ_CFMhi);
    [ABHi2k,ABHi2PR60] = compareToShamHi(IQhi2T, IQhi2C, IQ_CFMhi);
    [ABLo1k,ABLo1PR60] = compareToShamLo(IQlo1T, IQlo1C, IQ_CFMlo);
    [ABLo2k,ABLo2PR60] = compareToShamLo(IQlo2T, IQlo2C, IQ_CFMlo);

    %% K

    %non-normalized k values
    kHi = [findK(IQhi1C, 4300),findK(IQhi2C, 3300)];
    kLo = [findK(IQlo1C, 3300),findK(IQlo2C, 2350)];

    %k values normalized by CFM
    %kHi = [findK(IQhi1C, 4300),findK(IQhi2C, 3300)]./IQ_CFMhi;
    %kLo = [findK(IQlo1C, 3300),findK(IQlo2C, 2350)]./IQ_CFMlo;

    %k values above and beyond sham filter, normalized by ACM
    %kHi = [ABHi1k, ABHi2k];
    %kLo = [ABLo1k, ABLo2k];

    %% PR60
    
    %per cent particle reduction 1 hour from filter being turned on
    %hi1, hi2, lo1, lo2
    PR60 = [perRed(IQhi1T,IQhi1C), perRed(IQhi2T,IQhi2C), perRed(IQlo1T,IQlo1C), perRed(IQlo2T,IQlo2C)];

    %PR60 above and beyond sham filter, normalized by ACM
    %hi1, hi2, lo1, lo2
    %PR60 = [ABHi1PR60,ABHi2PR60,ABLo1PR60,ABLo2PR60];

    %% PLOTTING

    %figure
    %plot(IQhi1T,IQhi1C, IQhi2T,IQhi2C, IQlo1T,IQlo1C, IQlo2T,IQlo2C)
    %legend('High 1', 'High 2', 'Low 1', 'Low 2')

    %figure
    %plot(IQhiAvgT,IQhiAvgC, IQloAvgT,IQloAvgC)
    %legend('High Average', 'Low Average')
end