%No filter data; outputs a vector of k values for hi and lo + PR60 values
function [k, PR60] = NF()
    NF_CFM = 100/880;   %fake ass flowrate to make normalization look better

    NF1 = csvread('NF 1.dat', 6, 2);
    NF2 = csvread('NF 2.dat', 6, 2);
    %NF3 = csvread('NF 3.txt', 6, 2); WE HAVE NO IDEA WHERE THIS DATA
    %CAME FROM. SPOOOOOKY

    [NF1T,NF1C] = getVec(NF1, [76.75]);
    [NF2T,NF2C] = getVec(NF2, [81.75]);
    %[NF3T,NF3C] = getVec(NF3, [76]);

    NFAvgC = (NF1C + NF2C)/2;
    NFAvgT = (NF1T + NF2T)/2;

    %non-normalized k value
    k = [findK(NF1C, 2650), findK(NF2C, 3300)];
    mean(k)*60
    std(k)*60

    %""normalized"" to match with stuff that actually has a flowrate
    %k = [findK(NF1C, 2650), findK(NF2C, 3300)]./NF_CFM;

    %per cent particle reduction 1 hour from filter being turned on
    %t1, t2
    PR60 = [perRed(NF1T, NF1C), perRed(NF2T, NF2C), 0, 0];

%     figure
%     plot(NF1T,NF1C, NF2T,NF2C)
%     legend('Trial 1', 'Trial 2')

    %don't use this until you can align their curves rather than
    %starting places
    %figure
    %plot(NFAvgT,NFAvgC)
end