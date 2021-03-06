figure('rend', 'painters', 'pos', [10 10 700 550])
hold on
times = 0:30;
plot(times, exp(-1*k_impAAP_hi(2)*times), 'r-', 'LineWidth', 1.5);
plot(times, exp(-1*k_impAAP_lo(2)*times), 'r--', 'LineWidth', 1.5);

plot(times, exp(-1*k_impSHAM_hi(2)*times), 'k-', 'LineWidth', 1.5);
plot(times, exp(-1*k_impSHAM_lo(2)*times), 'k--', 'LineWidth', 1.5);

plot(times, exp(-1*k_impNF(2)*times), 'b-.', 'LineWidth', 1.5);

sems_plots('SHAM hi.csv', 45, 1.5, 'kx', 1);
sems_plots('SHAM hi2.csv', 70, 1.5, 'ko', 1);
sems_plots('SHAM lo.csv', 70, 1.5, 'k+', 1);
sems_plots('SHAM lo2.csv', 55, 1.5, 'k*', 1);

sems_plots('AAP hi2.csv', 55, 1.5, 'rx', 1);
sems_plots('AAP hi.csv', 120, 1.5, 'ro', 1); % AAp high
sems_plots('AAP lo.csv', 70, 1.5, 'r+', 1); % AAp low (didn't collect after for 75min)
sems_plots('AAP lo2.csv', 55, 1.5, 'r*', 1);

sems_plots('no filter.csv', 75, 1.5, 'bx', 1);
axis([0, 30, 0, 1.00])
xlabel('Time since extinguish (min)', 'FontSize', 14);
ylabel('Normalized PM_1 Concentration', 'FontSize', 14);
legend('AAP high fit','AAP low fit', 'Sham high fit', 'Sham low fit', 'No Filter', 'high data 1','high data 2', 'low data 1', 'low data 2'); 
hold off


figure('rend', 'painters', 'pos', [10 10 700 550])
hold on
plot(times*ACMVector(2,1), exp(-1*k_impAAP_hi(2)*times), 'r-', 'LineWidth', 1.5);
plot(times*ACMVector(2,2), exp(-1*k_impAAP_lo(2)*times), 'r--', 'LineWidth', 1.5);

plot(times*ACMVector(1,1), exp(-1*k_impSHAM_hi(2)*times), 'k-', 'LineWidth', 1.5);
plot(times*ACMVector(1,2), exp(-1*k_impSHAM_lo(2)*times), 'k--', 'LineWidth', 1.5);

sems_plots('SHAM hi.csv', 45, 1.5, 'kx', ACMVector(1,1));
sems_plots('SHAM hi2.csv', 70, 1.5, 'ko', ACMVector(1,1));
sems_plots('SHAM lo.csv', 70, 1.5, 'k+', ACMVector(1,2));
sems_plots('SHAM lo2.csv', 55, 1.5, 'k*', ACMVector(1,2));

sems_plots('AAP hi2.csv', 55, 1.5, 'rx', ACMVector(2,1));
sems_plots('AAP hi.csv', 120, 1.5, 'ro', ACMVector(2,1)); % AAp high
sems_plots('AAP lo.csv', 70, 1.5, 'r+', ACMVector(2,2)); % AAp low (didn't collect after for 75min)
sems_plots('AAP lo2.csv', 55, 1.5, 'r*', ACMVector(2,2));
axis([0, 5, 0, 1.00])
xlabel('Air changes since extinguish', 'FontSize', 14);
ylabel('Normalized PM_1 Concentration', 'FontSize', 14);
legend('AAP high fit','AAP low fit', 'Sham high fit', 'Sham low fit', 'high data 1','high data 2', 'low data 1', 'low data 2'); 
hold off

