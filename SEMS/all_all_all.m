%all of the trials
%Inputs: name = SEMS file name
%        b4filt = time (minutes) before filter is turned on
% uncomment below to run each test
% semsemsems('BS with sham.csv', 120); %BASELINE with Sham on
% semsemsems('BS with sham.csv', 170); %BASELINE with Sham on (**confirm this)
ACMVector = [264, 83.2; 241, 73.6; 45, 28; 94.4, 53.2; 93, 75.4; 309.9, 75]./880;
%FilterNames = {'AA NP', 'AA P', 'Box Fan', 'Holmes', 'HEPAirX', 'IQAir', 'Sham', 'No filter', 'Avg'};
[k_impAAP_hi1, p_impAAP_hi1, r2_impAAP_hi1, bins_AAP_hi1, ks_smooth_AAP_hi1, PRs_AAP_hi1, r2_AAP_hi1, p_cfm_AAP_hi1] = semsemsems('AAP hi.csv', 120, 1.5, ACMVector(2,1)); % AAp high
[k_impAAP_hi2, p_impAAP_hi2, r2_impAAP_hi2, bins_AAP_hi2, ks_smooth_AAP_hi2, PRs_AAP_hi2, r2_AAP_hi2, p_cfm_AAP_hi2] = semsemsems('AAP hi2.csv', 55, 1.5, ACMVector(2,1));
k_impAAP_hi = mean([transpose(k_impAAP_hi1); transpose(k_impAAP_hi2)]);
p_impAAP_hi = mean([transpose(p_impAAP_hi1); transpose(p_impAAP_hi2)]);
bins_AAP_hi = mean([bins_AAP_hi1; bins_AAP_hi2]);
ks_smooth_AAP_hi = mean([transpose(ks_smooth_AAP_hi1); transpose(ks_smooth_AAP_hi2)]);
PRs_AAP_hi = mean([transpose(PRs_AAP_hi1); transpose(PRs_AAP_hi2)]);
p_cfm_AAP_hi = mean([transpose(p_cfm_AAP_hi1); transpose(p_cfm_AAP_hi2)]);
r2_AAP_hi = mean([transpose(r2_AAP_hi1); transpose(r2_AAP_hi2)]);

[k_impAAP_lo1, p_impAAP_lo1, r2_impAAP_lo1, bins_AAP_lo1, ks_smooth_AAP_lo1, PRs_AAP_lo1, r2_AAP_lo1, p_cfm_AAP_lo1] = semsemsems('AAP lo.csv', 70, 1.5, ACMVector(2,2)); % AAp low (didn't collect after for 75min)
[k_impAAP_lo2, p_impAAP_lo2, r2_impAAP_lo2, bins_AAP_lo2, ks_smooth_AAP_lo2, PRs_AAP_lo2, r2_AAP_lo2, p_cfm_AAP_lo2] = semsemsems('AAP lo2.csv', 55, 1.5, ACMVector(2,2));
k_impAAP_lo = mean([transpose(k_impAAP_lo1); transpose(k_impAAP_lo2)]);
p_impAAP_lo = mean([transpose(p_impAAP_lo1); transpose(p_impAAP_lo2)]);
bins_AAP_lo = mean([bins_AAP_lo1; bins_AAP_lo2]);
ks_smooth_AAP_lo = mean([transpose(ks_smooth_AAP_lo1); transpose(ks_smooth_AAP_lo2)]);
PRs_AAP_lo = mean([transpose(PRs_AAP_lo1); transpose(PRs_AAP_lo2)]);
p_cfm_AAP_lo = mean([transpose(p_cfm_AAP_lo1); transpose(p_cfm_AAP_lo2)]);
r2_AAP_lo = mean([transpose(r2_AAP_lo1); transpose(r2_AAP_lo2)]);

    % semsemsems('HO hi bad.csv', 6); % HO high (accidentally left Sham on, started collecting data late)
[k_impHO_hi1, p_impHO_hi1, r2_impHO_hi1, bins_HO_hi1, ks_smooth_HO_hi1, PRs_HO_hi1, r2_HO_hi1, p_cfm_HO_hi1] =  semsemsems('HO hi.csv', 78, 1.5, ACMVector(4,1)); % HO high (mwah beautiful darling)
[k_impHO_hi2, p_impHO_hi2, r2_impHO_hi2, bins_HO_hi2, ks_smooth_HO_hi2, PRs_HO_hi2, r2_HO_hi2, p_cfm_HO_hi2] =  semsemsems('HO hi2.csv', 78, 1.5, ACMVector(4,1)); % HO high (mwah beautiful darling)
k_impHO_hi = mean([transpose(k_impHO_hi1); transpose(k_impHO_hi2)]);
p_impHO_hi = mean([transpose(p_impHO_hi1); transpose(p_impHO_hi2)]);
bins_HO_hi = mean([bins_HO_hi1; bins_HO_hi2]);
ks_smooth_HO_hi = mean([transpose(ks_smooth_HO_hi1); transpose(ks_smooth_HO_hi2)]);
PRs_HO_hi = mean([transpose(PRs_HO_hi1); transpose(PRs_HO_hi2)]);
p_cfm_HO_hi = mean([transpose(p_cfm_HO_hi1); transpose(p_cfm_HO_hi2)]);
r2_HO_hi = mean([transpose(r2_HO_hi1); transpose(r2_HO_hi2)]);

[k_impHO_lo1, p_impHO_lo1, r2_impHO_lo1, bins_HO_lo1, ks_smooth_HO_lo1, PRs_HO_lo1, r2_HO_lo1, p_cfm_HO_lo1] = semsemsems('HO lo.csv', 88, 1.5, ACMVector(4,2));
[k_impHO_lo2, p_impHO_lo2, r2_impHO_lo2, bins_HO_lo2, ks_smooth_HO_lo2, PRs_HO_lo2, r2_HO_lo2, p_cfm_HO_lo2] = semsemsems('HO lo2.csv', 50, 1.5, ACMVector(4,2));
k_impHO_lo = mean([transpose(k_impHO_lo1); transpose(k_impHO_lo2)]);
p_impHO_lo = mean([transpose(p_impHO_lo1); transpose(p_impHO_lo2)]);
bins_HO_lo = mean([bins_HO_lo1; bins_HO_lo2]);
ks_smooth_HO_lo = mean([transpose(ks_smooth_HO_lo1); transpose(ks_smooth_HO_lo2)]);
PRs_HO_lo = mean([transpose(PRs_HO_lo1); transpose(PRs_HO_lo2)]);
p_cfm_HO_lo = mean([transpose(p_cfm_HO_lo1); transpose(p_cfm_HO_lo2)]);
r2_HO_lo = mean([transpose(r2_HO_lo1); transpose(r2_HO_lo2)]);


[k_impSHAM_hi1, p_impSHAM_hi1, r2_impSHAM_hi1, bins_SHAM_hi1, ks_smooth_SHAM_hi1, PRs_SHAM_hi1, r2_SHAM_hi1, p_cfm_SHAM_hi1] = semsemsems('SHAM hi.csv', 45, 1.5, ACMVector(1,1));
[k_impSHAM_hi2, p_impSHAM_hi2, r2_impSHAM_hi2, bins_SHAM_hi2, ks_smooth_SHAM_hi2, PRs_SHAM_hi2, r2_SHAM_hi2, p_cfm_SHAM_hi2] = semsemsems('SHAM hi2.csv', 70, 1.5, ACMVector(1,1));
k_impSHAM_hi = mean([transpose(k_impSHAM_hi1); transpose(k_impSHAM_hi2)]);
p_impSHAM_hi = mean([transpose(p_impSHAM_hi1); transpose(p_impSHAM_hi2)]);
bins_SHAM_hi = mean([bins_SHAM_hi1; bins_SHAM_hi2]);
ks_smooth_SHAM_hi = mean([transpose(ks_smooth_SHAM_hi1); transpose(ks_smooth_SHAM_hi2)]);
PRs_SHAM_hi = mean([transpose(PRs_SHAM_hi1); transpose(PRs_SHAM_hi2)]);
p_cfm_SHAM_hi = mean([transpose(p_cfm_SHAM_hi1); transpose(p_cfm_SHAM_hi2)]);
r2_SHAM_hi = mean([transpose(r2_SHAM_hi1); transpose(r2_SHAM_hi2)]);


[k_impSHAM_lo1, p_impSHAM_lo1, r2_impSHAM_lo1, bins_SHAM_lo1, ks_smooth_SHAM_lo1, PRs_SHAM_lo1, r2_SHAM_lo1, p_cfm_SHAM_lo1] = semsemsems('SHAM lo.csv', 70, 1.5, ACMVector(1,2));
[k_impSHAM_lo2, p_impSHAM_lo2, r2_impSHAM_lo2, bins_SHAM_lo2, ks_smooth_SHAM_lo2, PRs_SHAM_lo2, r2_SHAM_lo2, p_cfm_SHAM_lo2] = semsemsems('SHAM lo2.csv', 55, 1.5, ACMVector(1,2));
k_impSHAM_lo = mean([transpose(k_impSHAM_lo1); transpose(k_impSHAM_lo2)]);
p_impSHAM_lo = mean([transpose(p_impSHAM_lo1); transpose(p_impSHAM_lo2)]);
bins_SHAM_lo = mean([bins_SHAM_lo1; bins_SHAM_lo2]);
ks_smooth_SHAM_lo = mean([transpose(ks_smooth_SHAM_lo1); transpose(ks_smooth_SHAM_lo2)]);
PRs_SHAM_lo = mean([transpose(PRs_SHAM_lo1); transpose(PRs_SHAM_lo2)]);
p_cfm_SHAM_lo = mean([transpose(p_cfm_SHAM_lo1); transpose(p_cfm_SHAM_lo2)]);
r2_SHAM_lo = mean([transpose(r2_SHAM_lo1); transpose(r2_SHAM_lo2)]);

[k_impBF_hi1, p_impBF_hi1, r2_impBF_hi1, bins_BF_hi1, ks_smooth_BF_hi1, PRs_BF_hi1, r2_BF_hi1, p_cfm_BF_hi1] = semsemsems('BF hi3.csv', 60, 1.5, ACMVector(3,1));
[k_impBF_hi2, p_impBF_hi2, r2_impBF_hi2, bins_BF_hi2, ks_smooth_BF_hi2, PRs_BF_hi2, r2_BF_hi2, p_cfm_BF_hi2] = semsemsems('BF hi2.csv', 65, 1.5, ACMVector(3,1));
k_impBF_hi = mean([transpose(k_impBF_hi1); transpose(k_impBF_hi2)]);
p_impBF_hi = mean([transpose(p_impBF_hi1); transpose(p_impBF_hi2)]);
bins_BF_hi = mean([bins_BF_hi1; bins_BF_hi2]);
ks_smooth_BF_hi = mean([transpose(ks_smooth_BF_hi1); transpose(ks_smooth_BF_hi2)]);
PRs_BF_hi = mean([transpose(PRs_BF_hi1); transpose(PRs_BF_hi2)]);
p_cfm_BF_hi = mean([transpose(p_cfm_BF_hi1); transpose(p_cfm_BF_hi2)]);
r2_BF_hi = mean([transpose(r2_BF_hi1); transpose(r2_BF_hi2)]);

[k_impBF_lo1, p_impBF_lo1, r2_impBF_lo1, bins_BF_lo1, ks_smooth_BF_lo1, PRs_BF_lo1, r2_BF_lo1, p_cfm_BF_lo1] = semsemsems('BF lo.csv', 50, 1.5, ACMVector(3,2));
[k_impBF_lo2, p_impBF_lo2, r2_impBF_lo2, bins_BF_lo2, ks_smooth_BF_lo2, PRs_BF_lo2, r2_BF_lo2, p_cfm_BF_lo2] = semsemsems('BF lo2.csv',10, 1.5, ACMVector(3,2));
k_impBF_lo = mean([transpose(k_impBF_lo1); transpose(k_impBF_lo2)]);
p_impBF_lo = mean([transpose(p_impBF_lo1); transpose(p_impBF_lo2)]);
bins_BF_lo = mean([bins_BF_lo1; bins_BF_lo2]);
ks_smooth_BF_lo = mean([transpose(ks_smooth_BF_lo1); transpose(ks_smooth_BF_lo2)]);
PRs_BF_lo = mean([transpose(PRs_BF_lo1); transpose(PRs_BF_lo2)]);
p_cfm_BF_lo = mean([transpose(p_cfm_BF_lo1); transpose(p_cfm_BF_lo2)]);
r2_BF_lo = mean([transpose(r2_BF_lo1); transpose(r2_BF_lo2)]);

[k_impAANP_hi1, p_impAANP_hi1, r2_impAANP_hi1, bins_AANP_hi1, ks_smooth_AANP_hi1, PRs_AANP_hi1, r2_AANP_hi1, p_cfm_AANP_hi1] = semsemsems('AANP hi.csv', 80, 1.5, ACMVector(1,1));
[k_impAANP_hi2, p_impAANP_hi2, r2_impAANP_hi2, bins_AANP_hi2, ks_smooth_AANP_hi2, PRs_AANP_hi2, r2_AANP_hi2, p_cfm_AANP_hi2] = semsemsems('AANP hi2.csv', 55, 1.5, ACMVector(1,1));
k_impAANP_hi = mean([transpose(k_impAANP_hi1); transpose(k_impAANP_hi2)]);
p_impAANP_hi = mean([transpose(p_impAANP_hi1); transpose(p_impAANP_hi2)]);
bins_AANP_hi = mean([bins_AANP_hi1; bins_AANP_hi2]);
ks_smooth_AANP_hi = mean([transpose(ks_smooth_AANP_hi1); transpose(ks_smooth_AANP_hi2)]);
PRs_AANP_hi = mean([transpose(PRs_AANP_hi1); transpose(PRs_AANP_hi2)]);
p_cfm_AANP_hi = mean([transpose(p_cfm_AANP_hi1); transpose(p_cfm_AANP_hi2)]);
r2_AANP_hi = mean([transpose(r2_AANP_hi1); transpose(r2_AANP_hi2)]);

[k_impAANP_lo1, p_impAANP_lo1, r2_impAANP_lo1, bins_AANP_lo1, ks_smooth_AANP_lo1, PRs_AANP_lo1, r2_AANP_lo1, p_cfm_AANP_lo1] = semsemsems('AANP lo2.csv', 60, 1.5, ACMVector(1,2));
[k_impAANP_lo2, p_impAANP_lo2, r2_impAANP_lo2, bins_AANP_lo2, ks_smooth_AANP_lo2, PRs_AANP_lo2, r2_AANP_lo2, p_cfm_AANP_lo2] = semsemsems('AANP lo3.csv', 45, 1.5, ACMVector(1,2));
k_impAANP_lo = mean([transpose(k_impAANP_lo1); transpose(k_impAANP_lo2)]);
p_impAANP_lo = mean([transpose(p_impAANP_lo1); transpose(p_impAANP_lo2)]);
bins_AANP_lo = mean([bins_AANP_lo1; bins_AANP_lo2]);
ks_smooth_AANP_lo = mean([transpose(ks_smooth_AANP_lo1); transpose(ks_smooth_AANP_lo2)]);
PRs_AANP_lo = mean([transpose(PRs_AANP_lo1); transpose(PRs_AANP_lo2)]);
p_cfm_AANP_lo = mean([transpose(p_cfm_AANP_lo1); transpose(p_cfm_AANP_lo2)]);
r2_AANP_lo = mean([transpose(r2_AANP_lo1); transpose(r2_AANP_lo2)]);


[k_impNF, p_impNF, r2_impNF, bins_NF, ks_smooth_NF, PRs_NF, r2_NF, p_cfm_NF] = semsemsems('no filter.csv', 75, 1.5, 1);

[k_impIQ_hi1, p_impIQ_hi1, r2_impIQ_hi1, bins_IQ_hi1, ks_smooth_IQ_hi1, PRs_IQ_hi1, r2_IQ_hi1, p_cfm_IQ_hi1] = semsemsems('IQ hi.csv', 50, 1.5, ACMVector(6,1));
[k_impIQ_hi2, p_impIQ_hi2, r2_impIQ_hi2, bins_IQ_hi2, ks_smooth_IQ_hi2, PRs_IQ_hi2, r2_IQ_hi2, p_cfm_IQ_hi2] = semsemsems('IQ hi2.csv', 50, 1.5, ACMVector(6,1));
k_impIQ_hi = mean([transpose(k_impIQ_hi1); transpose(k_impIQ_hi2)]);
p_impIQ_hi = mean([transpose(p_impIQ_hi1); transpose(p_impIQ_hi2)]);
bins_IQ_hi = mean([bins_IQ_hi1; bins_IQ_hi2]);
ks_smooth_IQ_hi = mean([transpose(ks_smooth_IQ_hi1); transpose(ks_smooth_IQ_hi2)]);
PRs_IQ_hi = mean([transpose(PRs_IQ_hi1); transpose(PRs_IQ_hi2)]);
p_cfm_IQ_hi = mean([transpose(p_cfm_IQ_hi1); transpose(p_cfm_IQ_hi2)]);
r2_IQ_hi = mean([transpose(r2_IQ_hi1); transpose(r2_IQ_hi2)]);

[k_impIQ_lo1, p_impIQ_lo1, r2_impIQ_lo1, bins_IQ_lo1, ks_smooth_IQ_lo1, PRs_IQ_lo1, r2_IQ_lo1, p_cfm_IQ_lo1] = semsemsems('IQ lo0.csv', 50, 1.5, ACMVector(5,2));
[k_impIQ_lo2, p_impIQ_lo2, r2_impIQ_lo2, bins_IQ_lo2, ks_smooth_IQ_lo2, PRs_IQ_lo2, r2_IQ_lo2, p_cfm_IQ_lo2] = semsemsems('IQ lo2.csv', 50, 1.5, ACMVector(5,2));
k_impIQ_lo = mean([transpose(k_impIQ_lo1); transpose(k_impIQ_lo2)]);
p_impIQ_lo = mean([transpose(p_impIQ_lo1); transpose(p_impIQ_lo2)]);
bins_IQ_lo = mean([bins_IQ_lo1; bins_IQ_lo2]);
ks_smooth_IQ_lo = mean([transpose(ks_smooth_IQ_lo1); transpose(ks_smooth_IQ_lo2)]);
PRs_IQ_lo = mean([transpose(PRs_IQ_lo1); transpose(PRs_IQ_lo2)]);
p_cfm_IQ_lo = mean([transpose(p_cfm_IQ_lo1); transpose(p_cfm_IQ_lo2)]);
r2_IQ_lo = mean([transpose(r2_IQ_lo1); transpose(r2_IQ_lo2)]);

[k_impHEX_hi1, p_impHEX_hi1, r2_impHEX_hi1, bins_HEX_hi1, ks_smooth_HEX_hi1, PRs_HEX_hi1, r2_HEX_hi1, p_cfm_HEX_hi1] = semsemsems('HEX hi.csv', 35, 1.5, ACMVector(4,1));
[k_impHEX_hi2, p_impHEX_hi2, r2_impHEX_hi2, bins_HEX_hi2, ks_smooth_HEX_hi2, PRs_HEX_hi2, r2_HEX_hi2, p_cfm_HEX_hi2] = semsemsems('HEX hi2.csv', 75, 1.5, ACMVector(4,1));
k_impHEX_hi = mean([transpose(k_impHEX_hi1); transpose(k_impHEX_hi2)]);
p_impHEX_hi = mean([transpose(p_impHEX_hi1); transpose(p_impHEX_hi2)]);
bins_HEX_hi = mean([bins_HEX_hi1; bins_HEX_hi2]);
ks_smooth_HEX_hi = mean([transpose(ks_smooth_HEX_hi1); transpose(ks_smooth_HEX_hi2)]);
PRs_HEX_hi = mean([transpose(PRs_HEX_hi1); transpose(PRs_HEX_hi2)]);
p_cfm_HEX_hi = mean([transpose(p_cfm_HEX_hi1); transpose(p_cfm_HEX_hi2)]);
r2_HEX_hi = mean([transpose(r2_HEX_hi1); transpose(r2_HEX_hi2)]);

[k_impHEX_lo1, p_impHEX_lo1, r2_impHEX_lo1, bins_HEX_lo1, ks_smooth_HEX_lo1, PRs_HEX_lo1, r2_HEX_lo1, p_cfm_HEX_lo1] = semsemsems('HEX lo.csv', 75, 1.5, ACMVector(4,2));
[k_impHEX_lo2, p_impHEX_lo2, r2_impHEX_lo2, bins_HEX_lo2, ks_smooth_HEX_lo2, PRs_HEX_lo2, r2_HEX_lo2, p_cfm_HEX_lo2] = semsemsems('HEX lo2.csv', 75, 1.5, ACMVector(4,2));
k_impHEX_lo = mean([transpose(k_impHEX_lo1); transpose(k_impHEX_lo2)]);
p_impHEX_lo = mean([transpose(p_impHEX_lo1); transpose(p_impHEX_lo2)]);
bins_HEX_lo = mean([bins_HEX_lo1; bins_HEX_lo2]);
ks_smooth_HEX_lo = mean([transpose(ks_smooth_HEX_lo1); transpose(ks_smooth_HEX_lo2)]);
PRs_HEX_lo = mean([transpose(PRs_HEX_lo1); transpose(PRs_HEX_lo2)]);
p_cfm_HEX_lo = mean([transpose(p_cfm_HEX_lo1); transpose(p_cfm_HEX_lo2)]);
r2_HEX_lo = mean([transpose(r2_HEX_lo1); transpose(r2_HEX_lo2)]);

%% AVERAGING
% I want you to make high and low averages
k_impAVG_hi = mean([transpose(k_impHEX_hi1); transpose(k_impHEX_hi2); transpose(k_impIQ_hi1); transpose(k_impIQ_hi2); transpose(k_impAAP_hi1); transpose(k_impAAP_hi2); transpose(k_impAANP_hi1); transpose(k_impAANP_hi2); transpose(k_impBF_hi1); transpose(k_impBF_hi2); transpose(k_impHO_hi1); transpose(k_impHO_hi2)]);
p_impAVG_hi = mean([transpose(p_impHEX_hi1); transpose(p_impHEX_hi2); transpose(p_impIQ_hi1); transpose(p_impIQ_hi2); transpose(p_impAAP_hi1); transpose(p_impAAP_hi2); transpose(p_impAANP_hi1); transpose(p_impAANP_hi2); transpose(p_impBF_hi1); transpose(p_impBF_hi2); transpose(p_impHO_hi1); transpose(p_impHO_hi2)]);
bins_AVG_hi = mean([bins_HEX_hi1; bins_HEX_hi2; bins_IQ_hi1; bins_IQ_hi2; bins_AAP_hi1; bins_AAP_hi2; bins_AANP_hi1; bins_AANP_hi2; bins_BF_hi1; bins_BF_hi2; bins_HO_hi1; bins_HO_hi2]);
ks_smooth_AVG_hi = mean([transpose(ks_smooth_HEX_hi1); transpose(ks_smooth_HEX_hi2); transpose(ks_smooth_IQ_hi1); transpose(ks_smooth_IQ_hi2); transpose(ks_smooth_AAP_hi1); transpose(ks_smooth_AAP_hi2); transpose(ks_smooth_AANP_hi1); transpose(ks_smooth_AANP_hi2)]);%; transpose(ks_smooth_BF_hi1); transpose(ks_smooth_BF_hi2); transpose(ks_smooth_HO_hi1); transpose(ks_smooth_HO_hi2)]);
PRs_AVG_hi = mean([transpose(PRs_HEX_hi1); transpose(PRs_HEX_hi2); transpose(PRs_IQ_hi1); transpose(PRs_IQ_hi2); transpose(PRs_AAP_hi1); transpose(PRs_AAP_hi2); transpose(PRs_AANP_hi1); transpose(PRs_AANP_hi2)]);%; transpose(PRs_BF_hi1); transpose(PRs_BF_hi2); transpose(PRs_HO_hi1); transpose(PRs_HO_hi2)]);
p_cfm_AVG_hi = mean([transpose(p_cfm_HEX_hi1); transpose(p_cfm_HEX_hi2); transpose(p_cfm_IQ_hi1); transpose(p_cfm_IQ_hi2); transpose(p_cfm_AAP_hi1); transpose(p_cfm_AAP_hi2); transpose(p_cfm_AANP_hi1); transpose(p_cfm_AANP_hi2)]);%; transpose(p_cfm_BF_hi1); transpose(p_cfm_BF_hi2); transpose(p_cfm_HO_hi1); transpose(p_cfm_HO_hi2)]);
r2_AVG_hi = mean(transpose([r2_HEX_hi1, r2_HEX_hi2, r2_IQ_hi1, r2_IQ_hi2, r2_AAP_hi1, r2_AAP_hi2, r2_AANP_hi1, r2_AANP_hi2, r2_BF_hi1, r2_BF_hi2, r2_HO_hi1, r2_HO_hi2]));

k_impAVG_lo = mean([transpose(k_impHEX_lo1); transpose(k_impHEX_lo2); transpose(k_impIQ_lo1); transpose(k_impIQ_lo2); transpose(k_impAAP_lo1); transpose(k_impAAP_lo2); transpose(k_impAANP_lo1); transpose(k_impAANP_lo2); transpose(k_impBF_lo1); transpose(k_impBF_lo2); transpose(k_impHO_lo1); transpose(k_impHO_lo2)]);
p_impAVG_lo = mean([transpose(p_impHEX_lo1); transpose(p_impHEX_lo2); transpose(p_impIQ_lo1); transpose(p_impIQ_lo2); transpose(p_impAAP_lo1); transpose(p_impAAP_lo2); transpose(p_impAANP_lo1); transpose(p_impAANP_lo2); transpose(p_impBF_lo1); transpose(p_impBF_lo2); transpose(p_impHO_lo1); transpose(p_impHO_lo2)]);
bins_AVG_lo = mean([bins_HEX_lo1; bins_HEX_lo2; bins_IQ_lo1; bins_IQ_lo2; bins_AAP_lo1; bins_AAP_lo2; bins_AANP_lo1; bins_AANP_lo2; bins_BF_lo1; bins_BF_lo2; bins_HO_lo1; bins_HO_lo2]);
ks_smooth_AVG_lo = mean([transpose(ks_smooth_HEX_lo1); transpose(ks_smooth_HEX_lo2); transpose(ks_smooth_IQ_lo1); transpose(ks_smooth_IQ_lo2); transpose(ks_smooth_AAP_lo1); transpose(ks_smooth_AAP_lo2); transpose(ks_smooth_AANP_lo1); transpose(ks_smooth_AANP_lo2)]);%; transpose(ks_smooth_BF_lo1); transpose(ks_smooth_BF_lo2); transpose(ks_smooth_HO_lo1); transpose(ks_smooth_HO_lo2)]);
PRs_AVG_lo = mean([transpose(PRs_HEX_lo1); transpose(PRs_HEX_lo2); transpose(PRs_IQ_lo1); transpose(PRs_IQ_lo2); transpose(PRs_AAP_lo1); transpose(PRs_AAP_lo2); transpose(PRs_AANP_lo1); transpose(PRs_AANP_lo2)]);%; transpose(PRs_BF_lo1); transpose(PRs_BF_lo2); transpose(PRs_HO_lo1); transpose(PRs_HO_lo2)]);
p_cfm_AVG_lo = mean([transpose(p_cfm_HEX_lo1); transpose(p_cfm_HEX_lo2); transpose(p_cfm_IQ_lo1); transpose(p_cfm_IQ_lo2); transpose(p_cfm_AAP_lo1); transpose(p_cfm_AAP_lo2); transpose(p_cfm_AANP_lo1); transpose(p_cfm_AANP_lo2)]);%; transpose(p_cfm_BF_lo1); transpose(p_cfm_BF_lo2); transpose(p_cfm_HO_lo1); transpose(p_cfm_HO_lo2)]);
r2_AVG_lo = mean(transpose([r2_HEX_lo1, r2_HEX_lo2, r2_IQ_lo1, r2_IQ_lo2, r2_AAP_lo1, r2_AAP_lo2, r2_AANP_lo1, r2_AANP_lo2, r2_BF_lo1, r2_BF_lo2, r2_HO_lo1, r2_HO_lo2]));


%% TIME FOR PLOTTING

    %% PLOT AC-NORMALIZED K VALUES
%     kVector = [kAANPAChi, kAANPAClo; kAAPAChi, kAAPAClo; kBFAChi, kBFAClo; kHAChi, kHAClo; kHEPAXACc, 0; kIQAChi, kIQAClo; kSHAMAChi, kSHAMAClo];
%     barPlot(FilterNames, kVector);
%         ylabel('k value (1/air changes)', 'FontSize', 12);
%         title('k value per air change', 'FontSize', 12)
%         legend('High', 'Low')

    
%% EXPONENTIAL FIT PLOTS
%UFP
%ufp
%PM_1
%pm1
%Average initial conc
%avg_initial_conc
    
%% PLOT NON-NORMALIZED AVERAGE K VALUES
% FilterNames = {'AA NP', 'AA P', 'Holmes', 'HEPAirX', 'IQAir', 'Avg', 'Sham', 'No filter'};
% BarLeg = {'High UFP', 'High PM_1','Low UFP', 'Low PM_1'};
% kVector = [k_impAANP_hi(1), k_impAANP_hi(2), ...k_impAANP_hi(3), k_impAANP_hi(4),...
%     k_impAANP_lo(1), k_impAANP_lo(2); ...k_impAANP_lo(3), k_impAANP_lo(4);...
%     k_impAAP_hi(1), k_impAAP_hi(2), ...k_impAAP_hi(3), k_impAAP_hi(4),...
%     k_impAAP_lo(1), k_impAAP_lo(2); ...k_impAAP_lo(3), k_impAAP_lo(4);...
%     k_impBF_hi(1), k_impBF_hi(2), ...k_impBF_hi(3), k_impBF_hi(4),...
%     k_impBF_lo(1), k_impBF_lo(2); ...k_impBF_lo(3), k_impBF_lo(4);...
%     k_impHO_hi(1), k_impHO_hi(2), ...k_impHO_hi(3), k_impHO_hi(4),...
%     k_impHO_lo(1), k_impHO_lo(2); ...k_impHO_lo(3), k_impHO_lo(4);...
%     k_impHEX_hi(1), k_impHEX_hi(2), ...k_impHEX_hi(3), k_impHEX_hi(4),...
%     k_impHEX_lo(1), k_impHEX_lo(2); ...k_impHEX_lo(3), k_impHEX_lo(4);...
%     k_impIQ_hi(1), k_impIQ_hi(2), ...k_impIQ_hi(3), k_impIQ_hi(4),...
%     k_impIQ_lo(1), k_impIQ_lo(2);...k_impIQ_lo(3), k_impIQ_lo(4);...
%     k_impAVG_hi(1), k_impAVG_hi(2), ..., k_impAVG_hi(3), k_impAVG_hi(4),...
%     k_impAVG_lo(1), k_impAVG_lo(2); ..., k_impAVG_lo(3), k_impAVG_lo(4)...
%     k_impSHAM_hi(1), k_impSHAM_hi(2), ...k_impSHAM_hi(3), k_impSHAM_hi(4),...
%     k_impSHAM_lo(1), k_impSHAM_lo(2); ...k_impSHAM_lo(3), k_impSHAM_lo(4);...
%     k_impNF(1), k_impNF(2), ...k_impNF(3), k_impNF(4),...
%     0,0;...0,0; ...
%     ];
% hi_ex = [ACMVector(:,1); mean(ACMVector(:,1)); ACMVector(1,1); 1]; 
% lo_ex = [ACMVector(:,2); mean(ACMVector(:,2)); ACMVector(1,2); 1];
% kVector_ex = [kVector(:,1)./hi_ex kVector(:,2)./hi_ex kVector(:,3)./lo_ex kVector(:,4)./lo_ex];
% kVector_plot = [kVector(1:2,:); kVector(4:end, :)];
% kVector_ex_plot = [kVector_ex(1:2,:); kVector_ex(4:end-1, :)];
%     %kVector(:,5)./lo_ex kVector(:,6)./lo_ex kVector(:,7)./lo_ex kVector(:,8)./lo_ex];
% barPlot(FilterNames, kVector_plot);
%     ylabel('k value (min^{-1})', 'FontSize', 14);
%     legend(BarLeg);
%     
% barPlot(FilterNames(1:end-1), kVector_ex_plot);
%     ylabel('k value (air change^{-1})', 'FontSize', 14);
%     legend(BarLeg);
% %         axis([0 8 0 0.28])


%% PLOT SMOOTHED K VALUES
% figure('rend', 'painters', 'pos', [10 10 700 550])
%      hold on
% threshold = .65;
% semilogx(bins_AAP_hi(r2_AANP_hi>threshold),ks_smooth_AANP_hi(r2_AANP_hi>threshold), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AANP_lo>threshold),ks_smooth_AANP_lo(r2_AANP_lo>threshold), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),ks_smooth_AAP_hi(r2_AAP_hi>threshold), 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
% %semilogx(bins_AAP_hi(r2_BF_hi>threshold),ks_smooth_BF_hi(r2_BF_hi>threshold), 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_hi>threshold),ks_smooth_HO_hi(r2_HO_hi>threshold), 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_hi>threshold),ks_smooth_HEX_hi(r2_HEX_hi>threshold), 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1);
% semilogx(bins_AAP_hi(r2_IQ_hi>threshold),ks_smooth_IQ_hi(r2_IQ_hi>threshold), 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1);
% plot(bins_AAP_hi(r2_AVG_hi>threshold),ks_smooth_AVG_hi(r2_AVG_hi>threshold), 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 1.5);
% plot(bins_AAP_hi(r2_SHAM_hi>.4),ks_smooth_SHAM_hi(r2_SHAM_hi>.4), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 1.5);
% plot(bins_AAP_hi(r2_NF>.4),ks_smooth_NF(r2_NF>.4), 'Color', [.4 .4 .4], 'linestyle', '-.', 'LineWidth', 1.5);
% 
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),ks_smooth_AAP_lo(r2_AAP_hi>threshold), 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
% %semilogx(bins_AAP_hi(r2_BF_lo>threshold),ks_smooth_BF_lo(r2_BF_lo>threshold), 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_lo>threshold),ks_smooth_HEX_lo(r2_HEX_lo>threshold), 'Color', [0 .7 .8], 'linestyle', '--', 'LineWidth', 1);
% semilogx(bins_AAP_hi(r2_HO_lo>threshold),ks_smooth_HO_lo(r2_HO_lo>threshold), 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1);
% plot(bins_AAP_hi(r2_IQ_lo>threshold),ks_smooth_IQ_lo(r2_IQ_lo>threshold), 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1);
% plot(bins_AAP_hi(r2_SHAM_lo>.4),ks_smooth_SHAM_lo(r2_SHAM_lo>.4), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 1.5);
% plot(bins_AAP_hi(r2_AVG_lo>threshold),ks_smooth_AVG_lo(r2_AVG_lo>threshold), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 1.5);
% 
% set(gca,'xscale','log') 
% ylabel('K value (min^{-1})', 'FontSize', 14);
% xlabel('Particle Diameter (nm)', 'FontSize', 14);
% legend('AAnp high', 'AAnp low', 'AAp', 'Holmes', 'HepAirX', 'IQ Air', 'Avg. HEPA', 'Sham', 'No Filter');
% %legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Sham high', 'Sham low', 'No filter', 'Avg HEPA high', 'Avg HEPA low');
% axis([18, 2000, 0, .35])
% hold off


%% PLOT SMOOTHED K VALUES wrt CFM
% figure('rend', 'painters', 'pos', [10 10 700 550])
%      hold on
% 
% threshold = .65;
% semilogx(bins_AAP_hi(r2_AANP_hi>threshold),ks_smooth_AANP_hi(r2_AANP_hi>threshold)/ACMVector(1,1), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AANP_lo>threshold),ks_smooth_AANP_lo(r2_AANP_lo>threshold)/ACMVector(1,2), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),ks_smooth_AAP_hi(r2_AAP_hi>threshold)/ACMVector(2,1), 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
% %semilogx(bins_AAP_hi(r2_BF_hi>threshold),ks_smooth_BF_hi(r2_BF_hi>threshold)/ACMVector(3,1), 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
% %semilogx(bins_AAP_hi(r2_BF_lo>threshold),ks_smooth_BF_lo(r2_BF_lo>threshold)/ACMVector(3,2), 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_hi>threshold),ks_smooth_HO_hi(r2_HO_hi>threshold)/ACMVector(4,1), 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_hi>threshold),ks_smooth_HEX_hi(r2_HEX_hi>threshold)/ACMVector(5,1), 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1);
% semilogx(bins_AAP_hi(r2_IQ_hi>threshold),ks_smooth_IQ_hi(r2_IQ_hi>threshold)/ACMVector(6,1), 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1);
% plot(bins_AAP_hi(r2_AVG_hi>threshold),ks_smooth_AVG_hi(r2_AVG_hi>threshold)/mean(ACMVector(:,1)), 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 1.5);
% plot(bins_AAP_hi(r2_SHAM_hi>.4),ks_smooth_SHAM_hi(r2_SHAM_hi>.4)/ACMVector(1,1), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 1.5);
% 
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),ks_smooth_AAP_lo(r2_AAP_hi>threshold)/ACMVector(2,2), 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_lo>threshold),ks_smooth_HO_lo(r2_HO_lo>threshold)/ACMVector(4,2), 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1);
% semilogx(bins_AAP_hi(r2_HEX_lo>threshold),ks_smooth_HEX_lo(r2_HEX_lo>threshold)/ACMVector(5,2), 'Color', [0 .7 .8], 'linestyle', '--', 'LineWidth', 1);
% plot(bins_AAP_hi(r2_IQ_lo>threshold),ks_smooth_IQ_lo(r2_IQ_lo>threshold)/ACMVector(6,1), 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1);
% plot(bins_AAP_hi(r2_SHAM_lo>.4),ks_smooth_SHAM_lo(r2_SHAM_lo>.4)/ACMVector(1,2), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 1.5);
% 
% %plot(bins_AAP_hi(r2_NF>.4),ks_smooth_NF(r2_NF>.4)/ACMVector(), 'Color', [.5 .5 .5], 'linestyle', '-.', 'LineWidth', 1.5);
% plot(bins_AAP_hi(r2_AVG_lo>threshold),ks_smooth_AVG_lo(r2_AVG_lo>threshold)/mean(ACMVector(:,2)), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 1.5);
% %semilogx(bins_AAP_hi, r2_AVG_hi, 'Color', [1 0 0], 'linestyle', '-', 'LineWidth', 1.5)
% %semilogx(bins_AAP_hi, r2_AVG_lo, 'Color', [1 0 0], 'linestyle', '--', 'LineWidth', 1.5)
% set(gca,'xscale','log') 
% ylabel('K value (air change^{-1})', 'FontSize', 14);
% xlabel('Particle Diameter (nm)', 'FontSize', 14);
% legend('AAnp high', 'AAnp low', 'AAp', 'Holmes', 'HepAirX', 'IQ Air', 'Avg HEPA', 'Sham');
% %legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Sham high', 'Sham low', 'Avg HEPA high', 'Avg HEPA low');
% axis([18, 2000, 0, 3])
% hold off
% %% PLOT SMOOTHED PR30 VALUES
% figure('rend', 'painters', 'pos', [10 10 700 550])
%      hold on
% semilogx(bins_AAP_hi(r2_AANP_hi>threshold), PRs_AANP_hi(r2_AANP_hi>threshold), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AANP_lo>threshold),PRs_AANP_lo(r2_AANP_lo>threshold), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),PRs_AAP_hi(r2_AAP_hi>threshold), 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
% %semilogx(bins_AAP_hi(r2_BF_hi>threshold),PRs_BF_hi(r2_BF_hi>threshold), 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_hi>threshold),PRs_HO_hi(r2_HO_hi>threshold), 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_hi>threshold),PRs_HEX_hi(r2_HEX_hi>threshold), 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_IQ_hi>threshold),PRs_IQ_hi(r2_IQ_hi>threshold), 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AVG_hi>threshold),PRs_AVG_hi(r2_AVG_hi>threshold), 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 1.5)
% semilogx(bins_AAP_hi(r2_SHAM_hi>.4),PRs_SHAM_hi(r2_SHAM_hi>.4), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 1.5)
% plot(bins_AAP_hi(r2_NF>.4),ks_smooth_NF(r2_NF>.4), 'Color', [.5 .5 .5], 'linestyle', '-.', 'LineWidth', 1.5);
% 
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),PRs_AAP_lo(r2_AAP_hi>threshold), 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1)
% %semilogx(bins_AAP_hi(r2_BF_lo>threshold),PRs_BF_lo(r2_BF_lo>threshold), 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_lo>threshold),PRs_HO_lo(r2_HO_lo>threshold), 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_lo>threshold),PRs_HEX_lo(r2_HEX_lo>threshold), 'Color', [0 .7 .8], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_IQ_lo>threshold),PRs_IQ_lo(r2_IQ_lo>threshold), 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_SHAM_lo>.4),PRs_SHAM_lo(r2_SHAM_lo>.4), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 1.5)
% semilogx(bins_AAP_hi(r2_AVG_lo>threshold),PRs_AVG_lo(r2_AVG_lo>threshold), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 1.5)
% 
% 
% set(gca,'xscale','log') 
% ylabel('30 min Percent Reduction', 'FontSize', 14);
% xlabel('Particle Diameter (nm)', 'FontSize', 14);
% legend('AAnp high', 'AAnp low', 'AAp', 'Holmes', 'HepAirX', 'IQ Air', 'Avg. HEPA', 'Sham', 'No Filter');
% axis([18, 2000, 0, 1.00])


%% PLOT SMOOTHED PR CFM VALUES
% figure('rend', 'painters', 'pos', [10 10 700 550])
%      hold on
% semilogx(bins_AAP_hi(r2_AANP_hi>threshold), p_cfm_AANP_hi(r2_AANP_hi>threshold), 'Color', [1 .5 .5], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AANP_lo>threshold),p_cfm_AANP_lo(r2_AANP_lo>threshold), 'Color', [1 .5 .5], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),p_cfm_AAP_hi(r2_AAP_hi>threshold), 'Color', [1 .7 .4], 'linestyle', '-', 'LineWidth', 1)
% 
% %semilogx(bins_AAP_hi(r2_BF_hi>threshold),p_cfm_BF_hi(r2_BF_hi>threshold), 'Color', [.9 .9 0], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_hi>threshold),p_cfm_HO_hi(r2_HO_hi>threshold), 'Color', [.4 .9 .2], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_hi>threshold),p_cfm_HEX_hi(r2_HEX_hi>threshold), 'Color', [0 .7 .8], 'linestyle', '-', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_IQ_hi>threshold),p_cfm_IQ_hi(r2_IQ_hi>threshold), 'Color', [.75 .4 .8], 'linestyle', '-', 'LineWidth', 1)
% %plot(bins_AAP_hi(r2_NF>.4),ks_smooth_NF(r2_NF>.4), 'Color', [.5 .5 .5], 'linestyle', '-.', 'LineWidth', 1.5);
% semilogx(bins_AAP_hi(r2_AVG_hi>threshold),p_cfm_AVG_hi(r2_AVG_hi>threshold), 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 1.5)
% semilogx(bins_AAP_hi(r2_SHAM_hi>.4),p_cfm_SHAM_hi(r2_SHAM_hi>.4), 'Color', [.5 .5 .5], 'linestyle', '-', 'LineWidth', 1.5)
% 
% semilogx(bins_AAP_hi(r2_AAP_hi>threshold),p_cfm_AAP_lo(r2_AAP_hi>threshold), 'Color', [1 .7 .4], 'linestyle', '--', 'LineWidth', 1);
% %semilogx(bins_AAP_hi(r2_BF_lo>threshold),p_cfm_BF_lo(r2_BF_lo>threshold), 'Color', [.9 .9 0], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HO_lo>threshold),p_cfm_HO_lo(r2_HO_lo>threshold), 'Color', [.4 .9 .2], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_HEX_lo>threshold),p_cfm_HEX_lo(r2_HEX_lo>threshold), 'Color', [0 .7 .8], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_IQ_lo>threshold),p_cfm_IQ_lo(r2_IQ_lo>threshold), 'Color', [.75 .4 .8], 'linestyle', '--', 'LineWidth', 1)
% semilogx(bins_AAP_hi(r2_SHAM_lo>.4),p_cfm_SHAM_lo(r2_SHAM_lo>.4), 'Color', [.5 .5 .5], 'linestyle', '--', 'LineWidth', 1.5)
% semilogx(bins_AAP_hi(r2_AVG_lo>threshold),p_cfm_AVG_lo(r2_AVG_lo>threshold), 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 1.5)
% 
% 
% set(gca,'xscale','log') 
% ylabel('Air Change Percent Reduction', 'FontSize', 14);
% xlabel('Particle Diameter (nm)', 'FontSize', 14);
% legend('AAnp high', 'AAnp low', 'AAp', 'Holmes', 'HepAirX', 'IQ Air', 'Avg. HEPA', 'Sham');
% %these two are for average high and low, make these in a bit
% %plot(bins_AAP_hi,p_cfm_mean_hi, 'Color', [0 0 0], 'linestyle', '-', 'LineWidth', 2)
% %plot(bins_AAP_hi,SHAMloAvgC, 'Color', [0 0 0], 'linestyle', '--', 'LineWidth', 2) 
% %legend('AAnp high', 'AAnp low', 'AAp high', 'AAp low', 'BF high', 'BF low', 'H high', 'H low', 'HX high', 'HX low', 'IQ high', 'IQ low', 'Sham high', 'Sham lo', 'Avg HEPA high', 'Avg HEPA low')
% axis([18, 2000, 0, 1])



%% SAVE THE IMPORTANT STUFF IN CSV

% kVector_ex = [kVector(:,1)./hi_ex kVector(:,2)./hi_ex kVector(:,3)./hi_ex kVector(:,4)./hi_ex ...
%     kVector(:,5)./lo_ex kVector(:,6)./lo_ex kVector(:,7)./lo_ex kVector(:,8)./lo_ex];
% csvwrite('kBarVector_ex.csv',kVector_ex);
% csvwrite('kBarVector.csv',kVector);
% 
% ksBinsVector = transpose([bins_AAP_hi; ks_smooth_AANP_hi; ks_smooth_AANP_lo; ...
%     ks_smooth_AAP_hi; ks_smooth_AAP_lo;...
%     ks_smooth_BF_hi; ks_smooth_BF_lo;...
%     ks_smooth_HO_hi; ks_smooth_HO_lo; ...
%     ks_smooth_HEX_hi; ks_smooth_HEX_lo; ...
%     ks_smooth_IQ_hi; ks_smooth_IQ_lo; ...
%     transpose(ks_smooth_NF); ...
%     ks_smooth_SHAM_hi; ks_smooth_SHAM_lo; ...
%     ks_smooth_AVG_hi; ks_smooth_AVG_lo ...
%     ]);
% %csvwrite('ksBinsVector.csv',ksBinsVector);
% ks_cfm_Vector = transpose([ks_smooth_AANP_hi/ACMVector(1,1); ks_smooth_AANP_lo/ACMVector(1,2); ...
%     ks_smooth_AAP_hi/ACMVector(2,1); ks_smooth_AAP_lo/ACMVector(2,2); ...
%     ks_smooth_BF_hi/ACMVector(3,1); ks_smooth_BF_lo/ACMVector(3,2); ...
%     ks_smooth_HO_hi/ACMVector(4,1); ks_smooth_HO_lo/ACMVector(4,2); ...
%     ks_smooth_HEX_hi/ACMVector(5,1); ks_smooth_HEX_lo/ACMVector(5,2); ...
%     ks_smooth_IQ_hi/ACMVector(6,1); ks_smooth_IQ_lo/ACMVector(6,1); ...
%     ks_smooth_SHAM_hi/ACMVector(1,1); ks_smooth_SHAM_lo/ACMVector(1,2) ...
%     ]);
% %csvwrite('ks_cfm_Vector.csv',ks_cfm_Vector);
% %HLVector = ksBinsVector*.693./(ksBinsVector.*ksBinsVector); %half life in minutes
% %csvwrite('HLVector.csv', ksBinsVector);
% PRsBinsVector = transpose([bins_AAP_hi; PRs_AANP_hi; PRs_AANP_lo; ...
%     PRs_AAP_hi; PRs_AAP_lo;...
%     PRs_BF_hi; PRs_BF_lo;...
%     PRs_HO_hi; PRs_HO_lo; ...
%     PRs_HEX_hi; PRs_HEX_lo; ...
%     PRs_IQ_hi; PRs_IQ_lo; ...
%     transpose(PRs_NF); ...
%     PRs_SHAM_hi; PRs_SHAM_lo; ...
%     PRs_AVG_hi; PRs_AVG_lo ...
%     ]);
% %csvwrite('PRsBinsVector.csv',PRsBinsVector);
% p_cfm_Vector = transpose([p_cfm_AANP_hi; p_cfm_AANP_lo; ...
%     p_cfm_AAP_hi; p_cfm_AAP_lo;...
%     p_cfm_BF_hi; p_cfm_BF_lo;...
%     p_cfm_HO_hi; p_cfm_HO_lo; ...
%     p_cfm_HEX_hi; p_cfm_HEX_lo; ...
%     p_cfm_IQ_hi; p_cfm_IQ_lo; ...
%     transpose(p_cfm_NF); ...
%     p_cfm_SHAM_hi; p_cfm_SHAM_lo; ...
%     p_cfm_AVG_hi; p_cfm_AVG_lo ...
%     ]);
% %csvwrite('p_cfm_Vector.csv',p_cfm_Vector);
% r2_Vector = transpose([r2_AANP_hi; r2_AANP_lo; ...
%     r2_AAP_hi; r2_AAP_lo;...
%     r2_BF_hi; r2_BF_lo;...
%     r2_HO_hi; r2_HO_lo; ...
%     r2_HEX_hi; r2_HEX_lo; ...
%     r2_IQ_hi; r2_IQ_lo; ...
%     transpose(r2_NF); ...
%     r2_SHAM_hi; r2_SHAM_lo; ...
%     r2_AVG_hi; r2_AVG_lo ...
%     ]);
% csvwrite('r2_Vector.csv',r2_Vector);
% csvwrite('Ks.csv', [ksBinsVector ks_cfm_Vector]);
% csvwrite('PRs.csv', [PRsBinsVector p_cfm_Vector]);