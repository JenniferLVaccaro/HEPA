function res = find_1_k(time, decay)
%decay is an nx1 concentration vector
%res = [k value, initial concentration, % reduction, R^2 value]
    time_norm = time-time(1);                   %normalize time
    decay_norm = decay/decay(1);                %normalize the decay curve
    decay_norm(decay_norm==0) = .0001;          %remove zeros
    logdecay = log(decay_norm);                 %get some timing stuff
    
    [K,s] = polyfit(time_norm, logdecay, 1);    %get the linear regression
    
    rsqu = 1-s.normr^2/norm(logdecay-mean(logdecay))^2;
    percent = (decay(1)-decay(end))/decay(1);
    
    res = [-1*K(1) decay(1) percent rsqu];
end