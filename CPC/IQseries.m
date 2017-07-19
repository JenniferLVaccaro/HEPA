%IQ Air data; outputs normalized time and concentration vectors for plotting
function [IQhiAvgC, IQhiAvgT, IQhiAvgAC, IQloAvgC, IQloAvgT, IQloAvgAC, kAChi, kAClo, IQhiPR1AC, IQloPR1AC] = IQseries()
    IQ_CFMhi = 309.9/880; %CFM/volume = air changes per minute. NOT actually CFM.
    IQ_CFMlo = 75/880;

    %get data from files into matrix
    IQhi1 = csvread('IQ High 1.dat', 6, 2);
    IQhi2 = csvread('IQ High 2.dat', 6, 2);
    IQlo1 = csvread('IQ Low 1.dat', 6, 2);
    IQlo2 = csvread('IQ Low 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [IQhi1T,IQhi1C] = getVec(IQhi1, [77.5]);
    [IQhi2T,IQhi2C] = getVec(IQhi2, [78.5]);
    [IQlo1T,IQlo1C] = getVec(IQlo1, [74.75]);
    [IQlo2T,IQlo2C] = getVec(IQlo2, [87]);

    %average the 2 high trials and the 2 low trials
    [IQhiAvgT,IQhiAvgC] = goodAvg(IQhi1T, IQhi1C, IQhi2T, IQhi2C, 204);
    [IQloAvgT,IQloAvgC] = goodAvg(IQlo1T, IQlo1C, IQlo2T, IQlo2C, 203);

    %normalize averaged trials
    zeroIndex = find(IQhiAvgT == 0);
    IQhiAvgC = IQhiAvgC/IQhiAvgC(zeroIndex);
    zeroIndex = find(IQloAvgT == 0);
    IQloAvgC = IQloAvgC/IQloAvgC(zeroIndex); 
    
    %% AIR CHANGE VECTORS
    
    ACShi = IQ_CFMhi/60;  %air changes per second
    ACSlo = IQ_CFMlo/60;  %air changes per second
    IQhiAvgAC =IQhiAvgT*ACShi;
    IQloAvgAC = IQloAvgT*ACSlo;

    %% GET AC-NORMALIZED K VALUES

    kAChi = [findK(IQhiAvgC, 3100)]./ACShi;
    kAClo = [findK(IQloAvgC, 3300)]./ACSlo;

    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(IQhiAvgAC > 0.9999);
    sampleConc = IQhiAvgC(sampleIndex(1));

    IQhiPR1AC = 1 - sampleConc;
    
    %find low concentration at 1AC
    sampleIndex = find(IQloAvgAC > 0.9999);
    sampleConc = IQloAvgC(sampleIndex(1));

    IQloPR1AC = 1 - sampleConc; 
    
    
    %% CHOP
    zeroIndex = find(IQhiAvgT == 0);
    IQhiAvgC = IQhiAvgC(zeroIndex:zeroIndex + 220);
    IQhiAvgAC = IQhiAvgAC(zeroIndex:zeroIndex + 220);
    IQhiAvgT = IQhiAvgT(zeroIndex:zeroIndex + 220);
    zeroIndex = find(IQloAvgT == 0);
    IQloAvgC = IQloAvgC(zeroIndex:zeroIndex + 220); 
    IQloAvgAC = IQloAvgAC(zeroIndex:zeroIndex + 220); 
    IQloAvgT = IQloAvgT(zeroIndex:zeroIndex + 220); 
    
    %% PLOTTING

    %figure
    %plot(IQhiAvgT,IQhiAvgC, IQloAvgT,IQloAvgC)
    %legend('High Average', 'Low Average')
    
    %figure
    %plot(IQhiAvgAC,IQhiAvgC, IQloAvgAC,IQloAvgC)
    %legend('High Average', 'Low Average')
    %axis([0 10 0 1.2])
end