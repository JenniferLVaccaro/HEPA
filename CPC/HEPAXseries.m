%HEPAirX data; outputs normalized time and concentration vectors for plotting
function [HEPAXavgC, HEPAXavgT, HEPAXavgAC, kAC, HEPAXPR1AC] = HEPAXseries()
    %air changes per minute. NOT actually CFM.
    HEPAX_CFM = 93/880;    %Either 171 or 119 for 99.97%; 200 or 135 for 95%
    
    %get data from files into matrix
    HEPAXCool1 = csvread('HEPAX Cool 1.dat', 6, 2);
    HEPAXCool2 = csvread('HEPAX Cool 2.dat', 6, 2);
    HEPAXHeat = csvread('HEPAX Heat 1.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [HEPAXc1T,HEPAXc1C] = getVec(HEPAXCool1, [77]);
    [HEPAXc2T,HEPAXc2C] = getVec(HEPAXCool2, [77]);
    [HEPAXhT,HEPAXhC] = getVec(HEPAXHeat, [75]);
    
    %average the 3 trials (all high)
    [HEPAXavgT, HEPAXavgC] = threeAvg(HEPAXc1T, HEPAXc1C, HEPAXc2T, HEPAXc2C, HEPAXhT, HEPAXhC, 122);

    %normalize averaged trials
    zeroIndex = find(HEPAXavgT == 0);
    HEPAXavgC = HEPAXavgC/HEPAXavgC(zeroIndex);
    
    %% AIR CHANGE VECTORS
    
    ACS = HEPAX_CFM/60;  %air changes per second
    HEPAXavgAC =HEPAXavgT*ACS;

    %% GET AC-NORMALIZED K VALUES

    kAC = [findK(HEPAXavgC, 2400)]./ACS;
    %kACh = [findK(HEPAXhC, 2200)]./ACS;
  
    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(HEPAXavgAC > 0.9999);
    sampleConc = HEPAXavgC(sampleIndex(1));

    HEPAXPR1AC = 1 - sampleConc;
    
    
    %% CHOP
    zeroIndex = find(HEPAXavgT == 0);
    HEPAXavgC = HEPAXavgC(zeroIndex:zeroIndex + 220);
    HEPAXavgAC = HEPAXavgAC(zeroIndex:zeroIndex + 220);
    HEPAXavgT = HEPAXavgT(zeroIndex:zeroIndex + 220);
%     zeroIndex = find(HEPAXhT == 0);
%     HEPAXhNC = HEPAXhNC(zeroIndex:zeroIndex + 220);
%     HEPAXhAC = HEPAXhAC(zeroIndex:zeroIndex + 220);
%     HEPAXhT = HEPAXhT(zeroIndex:zeroIndex + 220);
    
    %% PLOTTING
    
    %figure
    %plot(HEPAXcAvgT,HEPAXcAvgC, HEPAXhT,HEPAXhNC)
    %legend('Cool Average', 'Heat')
    
    %figure
    %plot(HEPAXcAvgAC,HEPAXcAvgC, HEPAXhAC,HEPAXhNC)
    %legend('Cool Average', 'Heat')
    %axis([0 10 0 1.2])
    
    function [avgT, avgC] = threeAvg(T1, C1, T2, C2, T3, C3, cutoffTime)
        %takes three vectors and averages them by matching about the zero point
        zeroIndex1 = find(T1 == 0);
        zeroIndex2 = find(T2 == 0);
        zeroIndex3 = find(T3 == 0);

        %chop the vectors so their zero indices are in the same place, at cutoffTime
        C1 = C1((zeroIndex1 - cutoffTime):end);
        C2 = C2((zeroIndex2 - cutoffTime):end);
        C3 = C3((zeroIndex3 - cutoffTime):end);
        T1 = T1((zeroIndex1 - cutoffTime):end);

        %more chop to the same length
        C1 = C1(1:430);
        C2 = C2(1:430);
        C3 = C3(1:430);
        T1 = T1(1:430);

        %geometric average
        avgC = (C1.*C2.*C3).^(1/3);
        avgT = T1;
    end
end