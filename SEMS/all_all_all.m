%all of the trials
%Inputs: name = SEMS file name
%        b4filt = time (minutes) before filter is turned on
% uncomment below to run each test
% semsemsems('BS with sham.csv', 120); %BASELINE with Sham on
% semsemsems('BS with sham.csv', 170); %BASELINE with Sham on (**confirm this)
[k_AAP_hi_UFP, k_AAP_hi_PM, bins_AAP_hi, ks_smooth_AAP_hi, PRs_AAP_hi] = semsemsems('AAP hi.csv', 120, 1.5); % AAp high
    [k_AAP_lo_UFP, k_AAP_lo_PM, bins_AAP_lo, ks_smooth_AAP_lo, PRs_AAP_lo] = semsemsems('AAP lo.csv', 70, 1.5); % AAp low (didn't collect after for 75min)
% semsemsems('HO hi bad.csv', 6); % HO high (accidentally left Sham on, started collecting data late)
[k_HO_hi_UFP, k_HO_hi_PM, bins_HO_hi, ks_smooth_HO_hi, PRs_HO_hi] =  semsemsems('HO hi.csv', 78, 1.5); % HO high (mwah beautiful darling)
    [k_HO_lo_UFP, k_HO_lo_PM, bins_HO_lo, ks_smooth_HO_lo, PRs_HO_lo] = semsemsems('HO lo.csv', 88, 1.5);   
[k_SHAM_hi_UFP, k_SHAM_hi_PM, bins_SHAM_hi, ks_smooth_SHAM_hi, PRs_SHAM_hi] = semsemsems('SHAM hi.csv', 70, 1.5);
    k_SHAM_lo_UFP = 0; k_SHAM_lo_PM = 0; bins_SHAM_lo = 0; ks_smooth_SHAM_lo = 0; PRs_SHAM_lo = 0;
[k_BF_hi_UFP, k_BF_hi_PM, bins_BF_hi, ks_smooth_BF_hi, PRs_BF_hi] = semsemsems('BF hi.csv', 70, 1.5);
    [k_BF_lo_UFP, k_BF_lo_PM, bins_BF_lo, ks_smooth_BF_lo, PRs_BF_lo] = semsemsems('BF lo.csv', 60, 1.5);
[k_AANP_hi_UFP, k_AANP_hi_PM, bins_AANP_hi, ks_smooth_AANP_hi, PRs_AANP_hi] = semsemsems('AANP hi.csv', 75, 1.5);
    k_AANP_lo_UFP = 0; k_AANP_lo_PM = 0; bins_AANP_lo = zeros(36,1); ks_smooth_AANP_lo = zeros(36,1); PRs_AANP_lo = zeros(36,1);
[k_NF_UFP, k_NF_PM, bins_NF, ks_smooth_NF, PRs_NF] = semsemsems('no filter.csv', 75, 1.5);
[k_IQ_hi_UFP, k_IQ_hi_PM, bins_IQ_hi, ks_smooth_IQ_hi, PRs_IQ_hi] = semsemsems('IQ hi.csv', 65, 1.5);
    [k_IQ_lo_UFP, k_IQ_lo_PM, bins_IQ_lo, ks_smooth_IQ_lo, PRs_IQ_lo] = semsemsems('IQ lo.csv', 50, 1.5);
k_HEX_hi_UFP = 0; k_HEX_hi_PM = 0; bins_HEX_hi = zeros(36,1); ks_smooth_HEX_hi = zeros(36,1); PRs_HEX_hi = zeros(36,1);
    k_HEX_lo_UFP = 0; k_HEX_lo_PM = 0; bins_HEX_lo = zeros(36,1); ks_smooth_HEX_lo = zeros(36,1); PRs_HEX_lo = zeros(36,1);

%% AVERAGING
% I want you to make high and low averages
    
%% TIME FOR PLOTTING

    %% PLOT AC-NORMALIZED K VALUES
%     kVector = [kAANPAChi, kAANPAClo; kAAPAChi, kAAPAClo; kBFAChi, kBFAClo; kHAChi, kHAClo; kHEPAXACc, 0; kIQAChi, kIQAClo; kSHAMAChi, kSHAMAClo];
%     barPlot(FilterNames, kVector);
%         ylabel('k value (1/air changes)', 'FontSize', 12);
%         title('k value per air change', 'FontSize', 12)
%         legend('High', 'Low')

    
%% PLOT NON-NORMALIZED AVERAGE K VALUES
FilterNames = {'AA NP', 'AA P', 'Box Fan', 'Holmes', 'HEPAirX', 'IQAir', 'Sham', 'No filter'};
kVector = [k_AANP_hi_PM, k_AANP_lo_PM, k_AANP_hi_UFP, k_AANP_lo_UFP;...
    k_AAP_hi_PM, k_AAP_lo_PM, k_AAP_hi_UFP, k_AAP_lo_UFP;...
    k_BF_hi_PM, k_BF_lo_PM, k_BF_hi_UFP, k_BF_lo_UFP;...
    k_HO_hi_PM, k_HO_lo_PM, k_HO_hi_UFP, k_HO_lo_UFP;...
    k_HEX_hi_PM, k_HEX_lo_PM, k_HEX_hi_UFP, k_HEX_lo_UFP;...
    k_IQ_hi_PM, k_IQ_lo_PM, k_IQ_hi_UFP, k_IQ_lo_UFP;...
    k_SHAM_hi_PM, k_SHAM_lo_PM, k_SHAM_hi_UFP, k_SHAM_lo_UFP;...
    k_NF_PM, k_NF_PM, k_NF_UFP, k_NF_UFP];

barPlot(FilterNames, kVector);
    ylabel('k value (1/min)', 'FontSize', 12);
    title('k value per time', 'FontSize', 12)
    legend('High PM', 'Low PM', 'High UFP', 'Low UFP')
%         axis([0 8 0 0.28])


%% PLOT SMOOTHED K VALUES
figure('rend', 'painters', 'pos', [10 10 700 550])
     hold on
plot(bins_AAP_hi,ks_smooth_AANP_hi, 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_AANP_lo, 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_AAP_hi, 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_AAP_lo, 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_BF_hi, 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_BF_lo, 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_HO_hi, 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_HO_lo, 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_HEX_hi, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_HEX_lo, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_IQ_hi, 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,ks_smooth_IQ_lo, 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1)
%these two are for average high and low, make these in a bit
%plot(bins_AAP_hi,SHAMhiAvgC, 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2)
%plot(bins_AAP_hi,SHAMloAvgC, 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2) 
legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Avg high', 'Avg low')

%% PLOT SMOOTHED PR30 VALUES
figure('rend', 'painters', 'pos', [10 10 700 550])
     hold on
plot(bins_AAP_hi,PRs_AANP_hi, 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_AANP_lo, 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_AAP_hi, 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_AAP_lo, 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_BF_hi, 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_BF_lo, 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_HO_hi, 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_HO_lo, 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_HEX_hi, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_HEX_lo, 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_IQ_hi, 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1)
plot(bins_AAP_hi,PRs_IQ_lo, 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1)
%these two are for average high and low, make these in a bit
%plot(bins_AAP_hi,SHAMhiAvgC, 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2)
%plot(bins_AAP_hi,SHAMloAvgC, 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2) 
legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Avg high', 'Avg low')
axis([0, 1000, 0, 1.02])

%end