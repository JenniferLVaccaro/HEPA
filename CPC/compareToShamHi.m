function [k, PR60] = compareToShamHi(Time, Conc, data_CFM)
    %input: matched time and concentration  vectors
    %output: input minus sham data
    SHAM_CFMhi = 250/880;

    SHAMhi1 = csvread('SHAM High 1.dat', 6, 2);
    SHAMhi2 = csvread('SHAM High 2.dat', 6, 2);

    [SHAMhi1T,SHAMhi1C] = getVec(SHAMhi1, [75]);
    [SHAMhi2T,SHAMhi2C] = getVec(SHAMhi2, [75]);

    %we have to line up the zero points of the sham and other filter data
    %find index of 1 hour mark
    sampleTime = 60*60; %seconds since filter turned on at 60 min
    dataIndex60 = find(Time == sampleTime);
    SHAMhi1Index60 = find(SHAMhi1T == sampleTime);
    SHAMhi2Index60 = find(SHAMhi2T == sampleTime);

    %find index of time when filter is turned on
    SHAMhi1Index0 = find(SHAMhi1T == 0);
    SHAMhi2Index0 = find(SHAMhi2T == 0);
    dataIndex0 = find(Time == 0);

    %chop filter time and data into only positive time
    DataC = Conc(dataIndex0:end);
    adjustedTime = Time(dataIndex0:(dataIndex0 + length(DataC) - 1));
    
    %chop and normalize the sham filter trials
    SHAMhi1C = SHAMhi1C(SHAMhi1Index0:SHAMhi1Index60)./SHAMhi1C(SHAMhi1Index0);
    SHAMhi1T = SHAMhi1T(SHAMhi1Index0:SHAMhi1Index60);
    SHAMhi2C = SHAMhi2C(SHAMhi2Index0:SHAMhi2Index60)./SHAMhi2C(SHAMhi2Index0);
    SHAMhi2T = SHAMhi2T(SHAMhi2Index0:SHAMhi2Index60);
    
    %average the sham filter trials for PR60
    SHAMhiAvgC = (SHAMhi1C./SHAMhi1C(1) .* SHAMhi2C./SHAMhi2C(1)).^.5;
    SHAMhiAvgT = (SHAMhi1T + SHAMhi2T)/2;

    %chop the filter data into T=0:240 (unless it's too short)
    try
        DataC = DataC(1:241)./DataC(1);
    catch
        DataC = DataC(1:end)./DataC(1);
    end
    adjustedTime = adjustedTime(1:length(DataC)-1);

    %find k value of normalized sham data 1
    SHAMdecay1 = SHAMhi1C(25:65);
    SHAMdecay1 = SHAMdecay1./SHAMdecay1(1);
    SHAMtime1 = SHAMhi1T(25:65);
    for i = 1:length(SHAMdecay1)
        SHAMdecay1(i) = log(SHAMdecay1(i)); %= -kt
        %decay(i) = decay(i)/(-15*i);
    end
    [kSHAM1, sSHAM1] = polyfit(SHAMtime1, SHAMdecay1, 1);
    kSHAM1 = -kSHAM1/SHAM_CFMhi;
    rsqSHAM1 = 1-sSHAM1.normr^2/norm(SHAMdecay1-mean(SHAMdecay1))^2;
    
    %find k value of normalized sham data 2
    SHAMdecay2 = SHAMhi2C(25:65);
    SHAMdecay2 = SHAMdecay2./SHAMdecay2(1);
    SHAMtime2 = SHAMhi2T(25:65);
    for i = 1:length(SHAMdecay2)
        SHAMdecay2(i) = log(SHAMdecay2(i)); %= -kt
        %decay(i) = decay(i)/(-15*i);
    end
    [kSHAM2, sSHAM2] = polyfit(SHAMtime2, SHAMdecay2, 1);
    kSHAM2 = -kSHAM2/SHAM_CFMhi;
    rsqSHAM2 = 1-sSHAM2.normr^2/norm(SHAMdecay2-mean(SHAMdecay2))^2;
    
    %average sham k values
    %change to geometric mean??
    kSHAM = (kSHAM1 + kSHAM2)/2;
    
    %find k value of normalized filter concentration data 2
    datadecay = DataC(20:70);
    datatime = adjustedTime(20:70);
    datadecay = datadecay./datadecay(1);
    for i = 1:length(datadecay)
        datadecay(i) = log(datadecay(i)); %= -kt
        %decay(i) = decay(i)/(-15*i);
    end
    [kData, sData] = polyfit(datatime, datadecay, 1);
    kData = -kData/data_CFM;
    rsqData = 1-sData.normr^2/norm(datadecay-mean(datadecay))^2;

    k = kData(1) - kSHAM(1);

    %find % reduction at 60 minutes for sham filter
    SHAMPR60 = 1 - SHAMhiAvgC(end)/SHAMhiAvgC(1);
    SHAMPR60 = SHAMPR60/SHAM_CFMhi;

    %find % reduction at 60 minutes for sample data
    try
        choppedData = Conc(dataIndex0:(dataIndex0+240));
    catch
        choppedData = Conc(dataIndex0:(dataIndex0+233));
    end 
    dataPR60 = 1 - choppedData(end)/choppedData(1);
    dataPR60 = dataPR60./data_CFM;

    %find difference in PR60s
    PR60 = dataPR60 - SHAMPR60;
    
end