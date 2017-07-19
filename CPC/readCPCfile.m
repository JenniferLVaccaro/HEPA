function output = readCPCfile()
%subfunctions parse all CPC .dat files into an array of [time (s), 
%concentration (?)] rows, and get a k value
    %% get k values and % reduction values of all the filters
	[AANPhi, AANPlo, PR60AANP] = AANP();
    AANPhi
    AANPlo
        AANPhiAvg = mean(AANPhi);
        AANPloAvg = mean(AANPlo);
        AANPhiPR30 = mean(PR60AANP(1:2));
        AANPloPR30 = mean(PR60AANP(3:4));
    [AAPhi, AAPlo, PR60AAP] = AAP();
    AAPhi
    AAPlo
        AAPhiAvg = mean(AAPhi);
        AAPloAvg = mean(AAPlo);
        AAPhiPR30 = mean(PR60AAP(1:2));
        AAPloPR30 = mean(PR60AAP(3:4));
    [BFhi, BFlo, PR60BF] = BF();
    BFhi
    BFlo
        BFhiAvg = mean(BFhi);
        BFloAvg = mean(BFlo);
        BFhiPR30 = mean(PR60BF(1:2));
        BFloPR30 = mean(PR60BF(3:4));
    [HEPAXheat, HEPAXcool, PR60HEPAX] = HEPAX();
    HEPAXheat
    HEPAXcool
        HEPAXheatAvg = mean(HEPAXheat);
        HEPAXcoolAvg = mean(HEPAXcool);
        HEPAXhPR30 = mean(PR60HEPAX(1:2));
        HEPAXcPR30 = PR60HEPAX(3);
    [Hhi, Hlo, ~, PR60H] = H();
    Hhi
    Hlo
        HhiAvg = mean(Hhi);
        HloAvg = Hlo;
        %HmedAvg = Hmed;
        HhiPR30 = mean(PR60H(1:2));
        HloPR30 = PR60H(3);
    [IQhi, IQlo, PR60IQ] = IQ();
    IQhi
    IQlo
        IQhiAvg = mean(IQhi);
        IQloAvg = mean(IQlo);
        IQhiPR30 = mean(PR60IQ(1:2));
        IQloPR30 = mean(PR60IQ(3:4));
    [SHAMhi, SHAMlo, PR60SHAM] = SHAM();
    SHAMhi
    SHAMlo
        SHAMhiAvg = mean(SHAMhi);
        SHAMloAvg = mean(SHAMlo);
        SHAMhiPR30 = mean(PR60SHAM(1:2));
        SHAMloPR30 = mean(PR60SHAM(3:4));

         ACMVector = [264, 83.2, 264, 83.2; 241, 73.6, 241, 73.6; 45, 28, 45, 28; 94.4, 53.2, 94.4, 53.2; 93, 0, 93, 0; 309.9, 75, 309.9, 75]./880;
         FilterNames = {'AA NP', 'AA P', 'Box Fan', 'Holmes', 'HEPAirX', 'IQAir', 'Sham'};

    %% GET NORMALIZED TIME SERIES
    [AANPhiAvgC, AANPhiAvgT, AANPhiAvgAC, AANPloAvgC, AANPloAvgT, AANPloAvgAC, kAANPAChi, kAANPAClo, AANPhiPR1AC, AANPloPR1AC] = AANPseries();
    [AAPhiAvgC, AAPhiAvgT, AAPhiAvgAC, AAPloAvgC, AAPloAvgT, AAPloAvgAC, kAAPAChi, kAAPAClo, AAPhiPR1AC, AAPloPR1AC] = AAPseries();
    [BFhiAvgC, BFhiAvgT, BFhiAvgAC, BFloAvgC, BFloAvgT, BFloAvgAC, kBFAChi, kBFAClo, BFhiPR1AC, BFloPR1AC] = BFseries();
    [HhiAvgC, HhiAvgT, HhiAvgAC, ~, ~, ~, Hlo2C, Hlo2T, Hlo2AC, kHAChi, kHACmed, kHAClo, HhiPR1AC, HmedPR1AC, HloPR1AC] = Hseries();
    [HEPAXcAvgC, HEPAXcAvgT, HEPAXcAvgAC, kHEPAXACc, HEPAXcPR1AC] = HEPAXseries();
    [IQhiAvgC, IQhiAvgT, IQhiAvgAC, IQloAvgC, IQloAvgT, IQloAvgAC, kIQAChi, kIQAClo, IQhiPR1AC, IQloPR1AC] = IQseries();
    [SHAMhiAvgC, SHAMhiAvgT, SHAMhiAvgAC, SHAMloAvgC, SHAMloAvgT, SHAMloAvgAC, kSHAMAChi, kSHAMAClo, SHAMhiPR1AC, SHAMloPR1AC] = SHAMseries();
    
    
    
    AvgArray = [AANPhiAvgC; AAPhiAvgC; BFhiAvgC; HhiAvgC; HEPAXcAvgC; IQhiAvgC];
    HiAvg = zeros(221,1);
    for i=1:221
        HiAvg(i) = mean(AvgArray(:,i));
    end
    AvgT = AANPhiAvgT/60;   %minutes instead of seconds
        
    AvgArray = [AANPloAvgC; AAPloAvgC; BFloAvgC; Hlo2C; IQloAvgC];
    LoAvg = zeros(221,1);
    for i=1:221
        LoAvg(i) = mean(AvgArray(:,i));
    end    
    
    AvgArray = [AANPhiAvgAC; AAPhiAvgAC; BFhiAvgAC; HhiAvgAC; HEPAXcAvgAC; IQhiAvgAC];
    HiAvgAC = zeros(221,1);
    for i=1:221
        HiAvgAC(i) = mean(AvgArray(:,i));
    end
    
    AvgArray = [AANPloAvgAC; AAPloAvgAC; BFloAvgAC; Hlo2AC; IQloAvgAC];
    LoAvgAC = zeros(221,1);
    for i=1:221
        LoAvgAC(i) = mean(AvgArray(:,i));
    end
  
    %hold on
    %plot(LoAvgAC,LoAvg, 'k', 'LineWidth', 3)
    %plot(LoAvgAC,AANPloAvgC, LoAvgAC,AAPloAvgC, LoAvgAC,BFloAvgC, LoAvgAC,Hlo2C, LoAvgAC,IQloAvgC)

    
    %% PLOT NORMALIZED TIME SERIES
    %plot(AANPhiAvgT/60,AANPhiAvgC, 'r', AANPloAvgT/60,AANPloAvgC, 'r--', AAPhiAvgT/60,AAPhiAvgC, 'm', AAPloAvgT/60,AAPloAvgC, 'm--', BFhiAvgT/60,BFhiAvgC, 'c', BFloAvgT/60,BFloAvgC, 'c--', HhiAvgT/60,HhiAvgC, 'g', Hmed2T/60,Hmed2C, 'g-.', Hlo2T/60,Hlo2C, 'g--', HEPAXcAvgT/60,HEPAXcAvgC, 'k', HEPAXhT/60,HEPAXhC, 'k', IQhiAvgT/60,IQhiAvgC, 'b', IQloAvgT/60,IQloAvgC, 'b--', SHAMhiAvgT/60,SHAMhiAvgC, 'y', SHAMloAvgT/60,SHAMloAvgC, 'y--')
%     figure('rend', 'painters', 'pos', [10 10 700 550])
%     hold on
%     plot(AvgT,AANPhiAvgC, 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,AANPloAvgC, 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
%         plot(AvgT,AAPhiAvgC, 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,AAPloAvgC, 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
%         plot(AvgT,BFhiAvgC, 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,BFloAvgC, 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
%         plot(AvgT,HhiAvgC, 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,Hlo2C, 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1)
%         plot(AvgT,HEPAXcAvgC, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,HEPAXhNC, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,IQhiAvgC, 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1)
%         plot(AvgT,IQloAvgC, 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1)
%         plot(AvgT,SHAMhiAvgC, 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 2)
%         plot(AvgT,SHAMloAvgC, 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 2) 
%      plot(AvgT,HiAvg, 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2);
%      plot(AvgT,LoAvg, 'Color', [0 0 0],'linestyle', '--', 'LineWidth', 2)
%         legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX cool', 'HX heat', 'IQ high', 'IQ low', 'Sham high', 'Sham low', 'Avg high', 'Avg low')
%         axis([0 30 0 1])
%         xlabel('Time since candle extinguish (min)', 'FontSize', 12);
%         ylabel('Normalized PNC', 'FontSize', 12);
%         title('Normalized total PNC vs. time', 'FontSize', 12);
%     hold off
     
     %% PLOT NORMALIZED AC SERIES
%     figure('rend', 'painters', 'pos', [10 10 700 550])
%     hold on
%     plot(HiAvgAC,AANPhiAvgC, 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
%         plot(LoAvgAC,AANPloAvgC, 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
%         plot(HiAvgAC,AAPhiAvgC, 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
%         plot(LoAvgAC,AAPloAvgC, 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
%         plot(HiAvgAC,BFhiAvgC, 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
%         plot(LoAvgAC,BFloAvgC, 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
%         plot(HiAvgAC,HhiAvgC, 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
%         plot(LoAvgAC,Hlo2C, 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1)
%         plot(HiAvgAC,HEPAXcAvgC, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
%         %plot(HiAvgAC,HEPAXhNC, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
%         plot(HiAvgAC,IQhiAvgC, 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1)
%         plot(LoAvgAC,IQloAvgC, 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1)
%         plot(HiAvgAC,SHAMhiAvgC, 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 2)
%         plot(LoAvgAC,SHAMloAvgC, 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 2)
%     plot(HiAvgAC,HiAvg, 'k', 'LineWidth', 2)
%     plot(LoAvgAC,LoAvg, 'k--', 'LineWidth', 2)
%         legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'IQ high', 'IQ low', 'Sham high', 'Sham low', 'Avg high', 'Avg low')
%         axis([0 6 0 1])
%         xlabel('Air changes since candle extinguish', 'FontSize', 12);
%         ylabel('Normalized PNC', 'FontSize', 12);
%         title('Normalized total PNC vs. air changes', 'FontSize', 12);
%         hold off

    
    %% PLOT AC-NORMALIZED K VALUES
%     kVector = [kAANPAChi, kAANPAClo; kAAPAChi, kAAPAClo; kBFAChi, kBFAClo; kHAChi, kHAClo; kHEPAXACc, 0; kIQAChi, kIQAClo; kSHAMAChi, kSHAMAClo];
%     barPlot(FilterNames, kVector);
%         ylabel('k value (1/air changes)', 'FontSize', 12);
%         title('k value per air change', 'FontSize', 12)
%         legend('High', 'Low')

    
    %% PLOT NON-NORMALIZED K VALUES
    %FilterNames = {'AA NP', 'AA P', 'Box Fan', 'Holmes', 'HEPAirX', 'IQAir'};
    
    %this kvector is for when we actually have CFM data for everyone
    kVector = [AANPhiAvg, AANPloAvg; AAPhiAvg, AAPloAvg; BFhiAvg, BFloAvg; HhiAvg, HloAvg; HEPAXheatAvg, 0; IQhiAvg, IQloAvg; SHAMhiAvg, SHAMloAvg]*60;
    
    
    %kVector = [AANPhiAvg, AANPloAvg; AAPhiAvg, AAPloAvg; 0, 0; 0, 0; 0, 0; IQhiAvg, IQloAvg].*60;
%     barPlot(FilterNames, kVector);
%         ylabel('k value (1/min)', 'FontSize', 12);
%         title('k value per time', 'FontSize', 12)
%         legend('High', 'Low')
%         axis([0 8 0 0.28])

    
            
    %% PLOT PR60 VALUES
    %this PR60vector is for when we actually have CFM data for everyone
    %PR60Vector = [PR60AANPhi, PR60AANPlo; PR60AAPhi, PR60AAPlo; PR60BFhi, PR60BFlo; PR60Hhi, PR60Hlo; PR60HEPAXh, PR60HEPAXc; PR60IQhi, PR60IQlo; PR60SHAMhi, PR60SHAMlo];
    
    %PR60Vector = [PR60AANPhi, PR60AANPlo; PR60AAPhi, PR60AAPlo; 0, 0; 0, 0; 0, 0; PR60IQhi, PR60IQlo];
%     barPlot(FilterNames, PR60Vector);
%        ylabel('% reduction', 'FontSize', 12);
%        title('% reduction in particles after 60 minutes, raw data', 'FontSize', 12);
%        legend('High', 'Low')
%        axis([0 9 0.999 1])
    
    %% PLOT COMBINED CPC PR1AC VALUES
    
%     PR1ACVector = [AANPhiPR1AC, AANPloPR1AC; AAPhiPR1AC, AAPloPR1AC; BFhiPR1AC, BFloPR1AC; HhiPR1AC, HloPR1AC; HEPAXcPR1AC, 0; IQhiPR1AC, IQloPR1AC; SHAMhiPR1AC, SHAMloPR1AC];
%     barPlot(FilterNames, PR1ACVector);
%        ylabel('% reduction', 'FontSize', 12);
%        title('% reduction in particles after 1 air change', 'FontSize', 12);
%        legend('High', 'Low')
    
    %% PLOT COMBINED CPC AND SMPS K/T VALUES
    %[std_TComb, std_ACComb] = errorBarMaker();
    
%     TCombinedKVector = [AANPhiAvg*60, AANPloAvg*60, 0.243845, 0.0928385; AAPhiAvg*60, AAPloAvg*60, 0.22021, 0.084622; BFhiAvg*60, BFloAvg*60, 0.126245, 0.0903275; HhiAvg*60, HloAvg*60, 0.162865, 0.131425; HEPAXcoolAvg*60, 0, 0.180136667, 0; IQhiAvg*60, IQloAvg*60, 0.19483, 0.086746; SHAMhiAvg*60, SHAMloAvg*60, 0.012854, 0.0073131];
%     barPlot(FilterNames, TCombinedKVector);
%         hold on
%         %errorbar1(tBar, TCombinedKVector, std_TComb)
%         %errorbar(1:7, TCombinedKVector, std_TComb, '.')
%         ylabel('k value (1/min)', 'FontSize', 12);
%         title('k value per time by filter', 'FontSize', 12);
%         legend('High Total', 'Low Total', 'High UFP', 'Low UFP')

    %% PLOT COMBINED CPC AND SMPS K/AC VALUES
    %ACCombinedKVector = [AANPhiPR1AC, AANPloPR1AC, 0.8583, 4.5773; AAPhiPR1AC, AAPloPR1AC, 0.7751, 4.1336; BFhiPR1AC, BFloPR1AC, 0.5555, 1.111; HhiPR1AC, HloPR1AC, 1.1466, 3.583; HEPAXcPR1AC, 0, 0.7962, 0; IQhiPR1AC, IQloPR1AC, 0.4763, 2.4148; SHAMhiPR1AC, SHAMloPR1AC, 0.0452, 0.2413];
    
    %TCombinedKVector = [AANPhiAvg*60, AANPloAvg*60, 0.243845, 0.0928385; AAPhiAvg*60, AAPloAvg*60, 0.22021, 0.084622; BFhiAvg*60, BFloAvg*60, 0.126245, 0.0903275; HhiAvg*60, HloAvg*60, 0.162865, 0.131425; HEPAXcoolAvg*60, 0, 0.180136667, 0; IQhiAvg*60, IQloAvg*60, 0.19483, 0.086746];
    %ACCombinedKVector = TCombinedKVector./ACMVector;
    
    %barPlot(FilterNames, ACCombinedKVector);
    %    ylabel('k value (1/AC)', 'FontSize', 12);
    %    title('k value per air change by filter', 'FontSize', 12);
    %    legend('High Total', 'Low Total', 'High UFP', 'Low UFP')
        
    %% PLOT COMBINED CPC AND SMPS PR1AC VALUES
    %NOTE that SMPS PR1AC data is from theoretical fit because that's how we did averaging
%     PR1ACCombinedVector = [AANPhiPR1AC, AANPloPR1AC, 0.5741, 0.8221; AAPhiPR1AC, AAPloPR1AC, 0.5373, 0.7928; BFhiPR1AC, BFloPR1AC, 0.4262, 0.5484; HhiPR1AC, HloPR1AC, 0.6802, 0.943; HEPAXcPR1AC, 0, 0.5473, 0; IQhiPR1AC, IQloPR1AC, 0.3856, 0.656; SHAMhiPR1AC, SHAMloPR1AC, 0.044, 0.1272];
%     barPlot(FilterNames, PR1ACCombinedVector);
%        ylabel('% reduction', 'FontSize', 12);
%        title('% reduction in particles after 1 air change', 'FontSize', 12);
%        legend('High', 'Low', 'High UFP', 'Low UFP')
       
       
    %% PLOT COMBINED CPC AND SMPS PR30 VALUES
%     PR30CombinedVector = [AANPhiPR30, AANPloPR30, 0.9976, 0.9348; AAPhiPR30, AAPloPR30, 0.9980, 0.9171; BFhiPR30, BFloPR30, 0.9676, 0.929; HhiPR30, HloPR30, 0.9911, 0.978; HEPAXcPR30, 0, 0.9958, 0; IQhiPR30, IQloPR30, 0.9932, 0.8998; SHAMhiPR30, SHAMloPR30, 0.3157, 0.2404];
%     barPlot(FilterNames, PR30CombinedVector);
%        ylabel('% reduction', 'FontSize', 12);
%        title('% reduction in particles after 30 minutes', 'FontSize', 12);
%        legend('High', 'Low', 'High UFP', 'Low UFP')


    %% PLOT ACM NORM DATA MINUS SHAM
%     TCombinedKVector = [AANPhiAvg*60, AANPloAvg*60, 0.243845, 0.0928385; AAPhiAvg*60, AAPloAvg*60, 0.22021, 0.084622; BFhiAvg*60, BFloAvg*60, 0.126245, 0.0903275; HhiAvg*60, HloAvg*60, 0.162865, 0.131425; HEPAXcoolAvg*60, 0, 0.180136667, 0; IQhiAvg*60, IQloAvg*60, 0.19483, 0.086746];
%     shamVector = [.057, .057, .0071, .0071; .057, .057, .0071, .0071; .057, .057, .0071, .0071; .057, .057, .0071, .0071; .057, .057, .0071, .0071; .057, .057, .0071, .0071];
%     kMinusSham = TCombinedKVector - shamVector;
%     ACMNormMinus = kMinusSham./ACMVector;
%     barPlot(FilterNames, ACMNormMinus)
%         ylabel('k value (1/AC)', 'FontSize', 12);
%         title('k value per air change, normalized for wall loss', 'FontSize', 12);
%         legend('High Total', 'Low Total', 'High UFP', 'Low UFP')
    
    function errorbar1(hBar, data, errs)
        %hBar = bar(xval,data);                     % Plot Data, Get Handle
        hold on
        for k1 = 1:length(hBar)                    % Loop: Plots Error Bars
            hb = get(get(hBar(k1),'Children'), 'XData');
            midbar = mean(hb);
            errorbar(midbar, data(:,k1), errs(:,k1), '.') % plotting errors
            sigbarx(k1,:) = midbar;                % Use To Plot Significance Bars
        end
    end
end