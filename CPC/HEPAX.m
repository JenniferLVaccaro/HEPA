%HEPAirX data; outputs a vector of k values for heat and cool + PR60 values
function [kHeat, kCool, PR60] = HEPAX()
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
    
    [HEPAXcAvgT, HEPAXcAvgC] = goodAvg(HEPAXc1T, HEPAXc1C, HEPAXc2T, HEPAXc2C, 147);
    
    %get data of filter effect 'above and beyond the sham filter'
    %DATA COMING SOON ::)
    
    %% K

    %non-normalized k values
    kC = [findK(HEPAXc1C, 2450),findK(HEPAXc2C, 2300)];
    kH = [findK(HEPAXhC, 2300)];
    kCool = (kC(1)+ kC(2) + kH)/3;
    kHeat = kCool;

    %k values normalized by CFM
    %kHeat = [findK(HEPAXc1C, 2450),findK(HEPAXc2C, 2300)]./HEPAX_CFM;
    %kCool = [findK(HEPAXhC, 2300)]./HEPAX_CFM;
    
    %k values above and beyond sham filter, normalized by ACM
    %DATA COMING SOON ::)

    %% PR60
    
    %per cent particle reduction 1 hour from filter being turned on
    %h1, h2, c
    PR60 = [perRed(HEPAXc1T,HEPAXc1C), perRed(HEPAXc2T,HEPAXc2C), perRed(HEPAXhT,HEPAXhC), 0];   
    
    %PR60 above and beyond sham filter, normalized by ACM
    %c1, c2, h1
    %DATA COMING SOON ::)

    %% PLOTTING
    
    %figure
    %plot(HEPAXc1T + 120,HEPAXc1C, HEPAXc2T + 105,HEPAXc2C, HEPAXhT,HEPAXhC)
    %legend('Cool 1', 'Cool 2', 'Heat')

    %figure
    %plot(HEPAXcAvgT,HEPAXcAvgC, HEPAXhT,HEPAXhC)
    %legend('Cool Average', 'Heat')
end