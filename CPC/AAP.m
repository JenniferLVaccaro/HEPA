%AustinAir w/Prefilter data; outputs a vector of k values for hi and lo + PR60 values
function [kHi, kLo, PR60] = AAP()
    AAP_CFMhi = 241/880;    %CFM/volume = air changes per minute. NOT actually CFM.
    AAP_CFMlo = 73.6/880;

    %get data from files into matrix
    AAPhi1 = csvread('AAP High 1.dat', 6, 2);
    AAPhi2 = csvread('AAP High 2.dat', 6, 2);
    AAPlo1 = csvread('AAP Low 1.dat', 6, 2);
    AAPlo2 = csvread('AAP Low 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [AAPhi1T,AAPhi1C] = getVec(AAPhi1, [75]);
    [AAPhi2T,AAPhi2C] = getVec(AAPhi2, [78]);
    [AAPlo1T,AAPlo1C] = getVec(AAPlo1, [75]);
    [AAPlo2T,AAPlo2C] = getVec(AAPlo2, [80]);
    
    %average the 2 high trials and the 2 low trials
    [AAPhiAvgT,AAPhiAvgC] = goodAvg(AAPhi1T, AAPhi1C, AAPhi2T, AAPhi2C, 150);
    [AAPloAvgT,AAPloAvgC] = goodAvg(AAPlo1T, AAPlo1C, AAPlo2T, AAPlo2C, 142);

    %get data of filter effect 'above and beyond the sham filter'
    [ABHi1k,ABHi1PR60] = compareToShamHi(AAPhi1T, AAPhi1C, AAP_CFMhi);
    [ABHi2k,ABHi2PR60] = compareToShamHi(AAPhi2T, AAPhi2C, AAP_CFMhi);
    [ABLo1k,ABLo1PR60] = compareToShamLo(AAPlo1T, AAPlo1C, AAP_CFMlo);
    [ABLo2k,ABLo2PR60] = compareToShamLo(AAPlo2T, AAPlo2C, AAP_CFMlo);

    %% K
    
    %non-normalized k values
    kHi = [findK(AAPhi1C, 2300),findK(AAPhi2C, 2300)];
    kLo = [findK(AAPlo1C, 2300),findK(AAPlo2C, 3300)];

    %k values normalized by CFM
    %kHi = [findK(AAPhi1C, 2300),findK(AAPhi2C, 2300)]./AAP_CFMhi;
    %kLo = [findK(AAPlo1C, 2300),findK(AAPlo2C, 3300)]./AAP_CFMlo;

    %k values above and beyond sham filter, normalized by ACM
    %kHi = [ABHi1k, ABHi2k];
    %kLo = [ABLo1k, ABLo2k];

    %% PR60
    
    %per cent particle reduction 1 hour from filter being turned on
    %hi1, hi2, lo1, lo2
    PR60 = [perRed(AAPhi1T,AAPhi1C), perRed(AAPhi2T,AAPhi2C), perRed(AAPlo1T,AAPlo1C), perRed(AAPlo2T,AAPlo2C)];

    %PR60 above and beyond sham filter, normalized by ACM
    %hi1, hi2, lo1, lo2
    %PR60 = [ABHi1PR60,ABHi2PR60,ABLo1PR60,ABLo2PR60];
    
    %% PLOTTING

    %figure
    %plot(AAPhi1T,AAPhi1C, AAPhi2T,AAPhi2C, AAPlo1T,AAPlo1C, AAPlo2T,AAPlo2C)
    %legend('High 1', 'High 2', 'Low 1', 'Low 2')

    %figure
    %plot(AAPhiAvgT,AAPhiAvgC, AAPloAvgT,AAPloAvgC)
    %legend('High Average', 'Low Average')
end