%AustinAir w/Prefilter data; outputs normalized time and concentration vectors for plotting
function [AAPhiAvgC, AAPhiAvgT, AAPhiAvgAC, AAPloAvgC, AAPloAvgT, AAPloAvgAC, kAChi, kAClo, AAPhiPR1AC, AAPloPR1AC] = AAPseries()
    AAP_CFMhi = 241/880;    %CFM/volume = air changes per minute. NOT actually CFM.
    AAP_CFMlo = 73.6/880;

    %get data from files into matrix
    AAPhi1 = csvread('AAP High 1.dat', 6, 2);
    AAPhi2 = csvread('AAP High 2.dat', 6, 2);
    AAPlo1 = csvread('AAP Low 1.dat', 6, 2);
    AAPlo2 = csvread('AAP Low 2.dat', 6, 2);

    %format the vectors using tuned zero-time input
    [AAPhi1T,AAPhi1C] = getVec(AAPhi1, [76.25]);
    [AAPhi2T,AAPhi2C] = getVec(AAPhi2, [77.5]);
    [AAPlo1T,AAPlo1C] = getVec(AAPlo1, [75]);
    [AAPlo2T,AAPlo2C] = getVec(AAPlo2, [79.75]);
    
    %average the 2 high trials and the 2 low trials
    [AAPhiAvgT,AAPhiAvgC] = goodAvg(AAPhi1T, AAPhi1C, AAPhi2T, AAPhi2C, 150);
    [AAPloAvgT,AAPloAvgC] = goodAvg(AAPlo1T, AAPlo1C, AAPlo2T, AAPlo2C, 142);

    %normalize averaged trials
    zeroIndex = find(AAPhiAvgT == -15);
    AAPhiAvgC = AAPhiAvgC/AAPhiAvgC(zeroIndex);
    zeroIndex = find(AAPloAvgT == 0);
    AAPloAvgC = AAPloAvgC/AAPloAvgC(zeroIndex);

    %% AIR CHANGE VECTORS
    
    ACShi = AAP_CFMhi/60;  %air changes per second
    ACSlo = AAP_CFMlo/60;  %air changes per second
    AAPhiAvgAC = AAPhiAvgT*ACShi;
    AAPloAvgAC = AAPloAvgT*ACSlo;

    %% GET AC-NORMALIZED K VALUES

    kAChi = [findK(AAPhiAvgC, 2300)]./ACShi;
    kAClo = [findK(AAPloAvgC, 2300)]./ACSlo;

    %% GET PR1AC VALUES
    
    %find high concentration at 1AC
    sampleIndex = find(AAPhiAvgAC > 0.9999);
    sampleConc = AAPhiAvgC(sampleIndex(1));
    
    AAPhiPR1AC = 1 - sampleConc;
    
    %find low concentration at 1AC
    sampleIndex = find(AAPloAvgAC > 0.9999);
    sampleConc = AAPloAvgC(sampleIndex(1));

    AAPloPR1AC = 1 - sampleConc;   
    
    %% CHOP
    zeroIndex = find(AAPhiAvgT == 0);
    AAPhiAvgC = AAPhiAvgC(zeroIndex:zeroIndex + 220);
    AAPhiAvgAC = AAPhiAvgAC(zeroIndex:zeroIndex + 220);
    AAPhiAvgT = AAPhiAvgT(zeroIndex:zeroIndex + 220);
    zeroIndex = find(AAPloAvgT == 0);
    AAPloAvgC = AAPloAvgC(zeroIndex:zeroIndex + 220);
    AAPloAvgAC = AAPloAvgAC(zeroIndex:zeroIndex + 220);
    AAPloAvgT = AAPloAvgT(zeroIndex:zeroIndex + 220);
    
    %% PLOTTING
    
    %figure
    %plot(AAPhiAvgT,AAPhiAvgC, AAPloAvgT,AAPloAvgC)
    %legend('High Average', 'Low Average')

    %figure
    %plot(AAPhiAvgAC,AAPhiAvgC, AAPloAvgAC,AAPloAvgC)
    %legend('High Average', 'Low Average')
    %axis([0 10 0 1.2])
end