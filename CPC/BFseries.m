%Box Fan data; outputs normalized time and concentration vectors for plotting
function [BFhiAvgC, BFhiAvgT, BFhiAvgAC, BFloAvgC, BFloAvgT, BFloAvgAC, kAChi, kAClo, BFhiPR1AC, BFloPR1AC] = BFseries()
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
    
    %normalize averaged trials
    % BFhiAvgC = BFhiAvgC/BFhiAvgC(BFhiAvgT==0)
    zeroIndex = find(BFhiAvgT == 0);
    BFhiAvgC = BFhiAvgC/BFhiAvgC(zeroIndex);
    zeroIndex = find(BFloAvgT == 0);
    BFloAvgC = BFloAvgC/BFloAvgC(zeroIndex);   
 
    %% AIR CHANGE VECTORS
    
    ACShi = BF_CFMhi/60;  %air changes per second
    ACSlo = BF_CFMlo/60;  %air changes per second
    BFhiAvgAC =BFhiAvgT*ACShi;
    BFloAvgAC = BFloAvgT*ACSlo;

    %% GET AC-NORMALIZED K VALUES

    kAChi = [findK(BFhiAvgC, 3300)]./ACShi;
    kAClo = [findK(BFloAvgC, 3300)]./ACSlo;
    
    
    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(BFhiAvgAC > 0.9999);
    sampleConc = BFhiAvgC(sampleIndex(1));

    BFhiPR1AC = 1 - sampleConc;
    
    %find low concentration at 1AC
    sampleIndex = find(BFloAvgAC > 0.9999);
    sampleConc = BFloAvgC(sampleIndex(1));

    BFloPR1AC = 1 - sampleConc; 
    
    
    %% CHOP
     zeroIndex = find(BFhiAvgT == 0);
     BFhiAvgC = BFhiAvgC(zeroIndex:zeroIndex + 220);
     BFhiAvgAC = BFhiAvgAC(zeroIndex:zeroIndex + 220);
     BFhiAvgT = BFhiAvgT(zeroIndex:zeroIndex + 220);
     zeroIndex = find(BFloAvgT == 0);
     BFloAvgC = BFloAvgC(zeroIndex:zeroIndex + 220);
     BFloAvgAC = BFloAvgAC(zeroIndex:zeroIndex + 220);
     BFloAvgT = BFloAvgT(zeroIndex:zeroIndex + 220);
     
    
    
    %% PLOTTING

    %figure
    %plot(BFhiAvgT,BFhiAvgC, BFloAvgT,BFloAvgC)
    %legend('High Average', 'Low Average')
    
    %figure
    %plot(BFhiAvgAC,BFhiAvgC, BFloAvgAC,BFloAvgC)
    %legend('High Average', 'Low Average')
    %axis([0 10 0 1.2])
end