function [Terrors, ACerrors] = errorBarMaker()
    AA_CFMhi = 250/880/60;   %CFM/volume = air changes per minute. NOT actually CFM.
    AA_CFMlo = 46.88/880/60;
    BF_CFMhi = 200/880/60;     %GUESS for air changes per minute. NOT actually CFM.
    BF_CFMlo = 100/880/60;     %GUESS for air changes per minute. NOT actually CFM.
    H_CFMhi = 125/880/60;  %GUESS for air changes per minute. NOT actually CFM.
    H_CFMlo = 40/880/60;   %GUESS for air changes per minute. NOT actually CFM.
    HEPAX_CFM = 200/880/60;    %Either 171 or 119 for 99.97%; 200 or 135 for 95%
    IQ_CFMhi = 360/880/60; %CFM/volume = air changes per minute. NOT actually CFM.
    IQ_CFMlo = 71/880/60;
  
    
    %% AANP
    %get data from files into matrix
    AANPhi1 = csvread('AANP High 1.dat', 6, 2);
    AANPhi2 = csvread('AANP High 2.dat', 6, 2);
    AANPlo1 = csvread('AANP Low 1.dat', 6, 2);
    AANPlo2 = csvread('AANP Low 2.dat', 6, 2);
    %format the vectors using tuned zero-time input
    [AANPhi1T,AANPhi1C] = getVec(AANPhi1, [75]);
    [AANPhi2T,AANPhi2C] = getVec(AANPhi2, [75]);
    [AANPlo1T,AANPlo1C] = getVec(AANPlo1, [75]);
    [AANPlo2T,AANPlo2C] = getVec(AANPlo2, [75]);  
    %non-normalized k values
    kHi = [findK(AANPhi1C, 2200),findK(AANPhi2C, 2200)];
    kLo = [findK(AANPlo1C, 2300),findK(AANPlo2C, 2500)];
    %get standard deviations of k values
    AANPSTDhi = std(kHi);
    AANPSTDlo = std(kLo);
    
    %% AAP
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
    %non-normalized k values
    kHi = [findK(AAPhi1C, 2300),findK(AAPhi2C, 2300)];
    kLo = [findK(AAPlo1C, 2300),findK(AAPlo2C, 3300)];
    %get standard deviations of k values
    AAPSTDhi = std(kHi);
    AAPSTDlo = std(kLo);
    
    %% BF
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
    %non-normalized k values
    kHi = [findK(BFhi1C, 3350),findK(BFhi2C, 3300)];
    kLo = [findK(BFlo1C, 3300),findK(BFlo2C, 3800)];
    %get standard deviations of k values
    BFSTDhi = std(kHi);
    BFSTDlo = std(kLo);
    
    %% H
    %get data from files into matrix
    Hhi1 = csvread('H High 1.dat', 6, 2);
    Hhi2 = csvread('H High 2.dat', 6, 2);
    Hlo2 = csvread('H Low 2.dat', 6, 2);
    %format the vectors using tuned zero-time input
    [Hhi1T,Hhi1C] = getVec(Hhi1, [75]);
    [Hhi2T,Hhi2C] = getVec(Hhi2, [79]);
    [Hlo2T,Hlo2C] = getVec(Hlo2, [79]);
    %non-normalized k values
    kHi = [findK(Hhi1C, 2400),findK(Hhi2C, 2300)];
    %get standard deviations of k values
    HSTDhi = std(kHi);

    
    %% HEPAX
    %get data from files into matrix
    HEPAXCool1 = csvread('HEPAX Cool 1.dat', 6, 2);
    HEPAXCool2 = csvread('HEPAX Cool 2.dat', 6, 2);
    HEPAXHeat = csvread('HEPAX Heat 1.dat', 6, 2);
    %format the vectors using tuned zero-time input
    [HEPAXc1T,HEPAXc1C] = getVec(HEPAXCool1, [77]);
    [HEPAXc2T,HEPAXc2C] = getVec(HEPAXCool2, [77]);
    [HEPAXhT,HEPAXhC] = getVec(HEPAXHeat, [75]);
    %non-normalized k values
    kHeat = [];
    kCool = [findK(HEPAXhC, 2300),findK(HEPAXc1C, 2450),findK(HEPAXc2C, 2300)];
    %get standard deviations of k values
    HEPAXSTDc = std(kCool);
    
    %% IQ
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
    %non-normalized k values
    kHi = [findK(IQhi1C, 4300),findK(IQhi2C, 3300)];
    kLo = [findK(IQlo1C, 3300),findK(IQlo2C, 2350)];
    %get standard deviations of k values
    IQSTDhi = std(kHi);
    IQSTDlo = std(kLo);
    
    %% SHAM
    %get data from files into matrix
    SHAMhi1 = csvread('SHAM High 1.dat', 6, 2);
    SHAMhi2 = csvread('SHAM High 2.dat', 6, 2);
    SHAMlo1 = csvread('SHAM Low 1.dat', 6, 2);
    SHAMlo2 = csvread('SHAM Low 2.dat', 6, 2);
    %format the vectors using tuned zero-time input
    [SHAMhi1T,SHAMhi1C] = getVec(SHAMhi1, [75]);
    [SHAMhi2T,SHAMhi2C] = getVec(SHAMhi2, [75]);
    [SHAMlo1T,SHAMlo1C] = getVec(SHAMlo1, [79]);
    [SHAMlo2T,SHAMlo2C] = getVec(SHAMlo2, [75]);
    %non-normalized k values
    kHi = [findK(SHAMhi1C, 2300),findK(SHAMhi2C, 3300)];
    kLo = [findK(SHAMlo1C, 3400),findK(SHAMlo2C, 3350)];
    %get standard deviations of k values
    SHAMSTDhi = std(kHi);
    SHAMSTDlo = std(kLo);
    
    %% ASSIGN
    HEPAXSTDc
    Terrors = [AANPSTDhi, AANPSTDlo, 0.024402255, 0.001233901; AAPSTDhi, AAPSTDlo, 0.000311127, 0.003348858; BFSTDhi, BFSTDlo, 0.017797878, 0.00431123; HSTDhi, 0, 0.002481945, 0.025307352; HEPAXSTDc, 0, 0.006088237, 0.006088237; IQSTDhi, IQSTDlo, 0.013732014, 0.011917578; SHAMSTDhi, SHAMSTDlo, 0.002702562, 0.000193606;];
    ACerrors = [AANPSTDhi/AA_CFMhi, AANPSTDlo/AA_CFMlo, 0.0859, 0.4581; AAPSTDhi/AA_CFMhi, AAPSTDlo/AA_CFMlo, 0.0011, 0.0058; BFSTDhi/BF_CFMhi, BFSTDlo/BF_CFMlo, 0.0783, 0.1566; HSTDhi/H_CFMhi, 0, 0.0175, 0.0546; HEPAXSTDc/HEPAX_CFM, 0, 0.0268, 0.0268; IQSTDhi/IQ_CFMhi, IQSTDlo/IQ_CFMlo, 0.0336, 0.702; SHAMSTDhi/AA_CFMhi, SHAMSTDlo/AA_CFMlo, 0.0095, 0.0507;];
end