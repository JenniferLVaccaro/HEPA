function [k, PR60] = compareToShamLo(Time, Conc, data_CFM)
    %input: matched time and concentration  vectors
    %output: input minus sham data
    SHAM_CFMlo = 46.88/880;

    SHAMlo1 = csvread('SHAM Low 1.dat', 6, 2);
    SHAMlo2 = csvread('SHAM Low 2.dat', 6, 2);

    [SHAMlo1T,SHAMlo1C] = getVec(SHAMlo1, [79]);
    [SHAMlo2T,SHAMlo2C] = getVec(SHAMlo2, [75]);

    %we have to line up the zero points of the sham and other filter data
    %find index of 1 hour mark
    sampleTime = 60*60; %seconds since filter turned on at 60 min
    dataIndex60 = find(Time == sampleTime);
    SHAMlo1Index60 = find(SHAMlo1T == sampleTime);
    SHAMlo2Index60 = find(SHAMlo2T == sampleTime);

    %find index of time when filter is turned on
    SHAMlo1Index0 = find(SHAMlo1T == 0);
    SHAMlo2Index0 = find(SHAMlo2T == 0);
    dataIndex0 = find(Time == 0);

    %chop filter time and data into only positive time
    DataC = Conc(dataIndex0:end);
    adjustedTime = Time(dataIndex0:(dataIndex0 + length(DataC) - 1));

    %chop the sham filter trials
    SHAMlo1C = SHAMlo1C(SHAMlo1Index0:SHAMlo1Index60);
    SHAMlo1T = SHAMlo1T(SHAMlo1Index0:SHAMlo1Index60);
    SHAMlo2C = SHAMlo2C(SHAMlo2Index0:SHAMlo2Index60);
    SHAMlo2T = SHAMlo2T(SHAMlo2Index0:SHAMlo2Index60);

    %average the sham filter trials for PR60
    SHAMloAvgC = (SHAMlo1C./SHAMlo1C(1) .* SHAMlo2C./SHAMlo2C(1)).^.5;
    SHAMloAvgT = (SHAMlo1T + SHAMlo2T)/2;

    %chop the filter data into T=0:240 (unless it's too short)
    try
        DataC = DataC(1:241)./DataC(1);
    catch
        DataC = DataC(1:end)./DataC(1);
    end
    adjustedTime = adjustedTime(1:length(DataC)-1);

    %find k value of normalized sham data 1
    SHAMdecay1 = SHAMlo1C(20:70);
    SHAMdecay1 = SHAMdecay1./SHAMdecay1(1);
    SHAMtime1 = SHAMlo1T(20:70);
    for i = 1:length(SHAMdecay1)
        SHAMdecay1(i) = log(SHAMdecay1(i)); %= -kt
        %decay(i) = decay(i)/(-15*i);
    end
    [kSHAM1, sSHAM1] = polyfit(SHAMtime1, SHAMdecay1, 1);
    kSHAM1 = -kSHAM1/SHAM_CFMlo;
    rsqSHAM1 = 1-sSHAM1.normr^2/norm(SHAMdecay1-mean(SHAMdecay1))^2;
    
    %find k value of normalized sham data 2
    SHAMdecay2 = SHAMlo2C(20:70);
    SHAMdecay2 = SHAMdecay2./SHAMdecay2(1);
    SHAMtime2 = SHAMlo2T(20:70);
    for i = 1:length(SHAMdecay2)
        SHAMdecay2(i) = log(SHAMdecay2(i)); %= -kt
        %decay(i) = decay(i)/(-15*i);
    end
    [kSHAM2, sSHAM2] = polyfit(SHAMtime2, SHAMdecay2, 1);
    kSHAM2 = -kSHAM2/SHAM_CFMlo;
    rsqSHAM2 = 1-sSHAM2.normr^2/norm(SHAMdecay2-mean(SHAMdecay2))^2;
    
    %average sham k values
    %change to geometric mean??
    kSHAM = (kSHAM1 + kSHAM2)/2;

    %find k value of normalized filter concentration data
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
    SHAMPR60 = 1 - SHAMloAvgC(end)/SHAMloAvgC(1);
    SHAMPR60 = SHAMPR60/SHAM_CFMlo;

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