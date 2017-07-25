function res = steady_state()
    C_out_scal = 10e4;
    in_rate_scal = .03;
    k_scal = .15;
    C_out = 5e3:5e3:5e5;
    in_rate = .01:.001:.05;
    k = .1:.001:.32;
    v = [5000 1;10000 2; 20000 3; 30000 4; 40000 5; 60000 7; 80000 9; 1e5 11; 1.2e5 12; 1.4e5 13; 1.6e5 14];
    HoldC = zeros(length(in_rate),length(k));
    for i=1:length(in_rate)
        for j=1:length(k)
            HoldC(i,j) = (C_out_scal*in_rate(i))/(in_rate(i)+k(j));
        end
    end
    HoldI = zeros(length(C_out),length(k));
    for i=1:length(C_out)
        for j=1:length(k)
            HoldI(i,j) = (C_out(i)*in_rate_scal)/(in_rate_scal+k(j));
        end
    end
    HoldK = zeros(length(in_rate),length(C_out));
    for i=1:length(in_rate)
        for j=1:length(C_out)
            HoldK(i,j) = (C_out(j)*in_rate(i))/(in_rate(i)+k_scal);
        end
    end
        figure
    hold on
    contourf(k, in_rate, HoldC, v, 'ShowText','on');
    title('C = 1e6');
    ylabel('In Rates (AX/min)');
    xlabel('K (AX/min)');
    hold off
        figure
    hold on
    contourf(k, C_out, HoldI, v, 'ShowText','on');
    title('I = 0.03');
    ylabel('C out');
    xlabel('K (AX/min)');
    hold off
        figure
    hold on
    contourf(C_out, in_rate, HoldK, v,'ShowText','on');
    title('K = 0.21');
    ylabel('In Rates (AX/min)');
    xlabel('C out');
    hold off 
end