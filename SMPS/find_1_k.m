function res = find_1_k(time, decay, norm_bool)
    if norm_bool
        decay = decay(5<=time&time<40);
        time = time(5<=time&time<40);
    end
    time_norm = time-time(1);
    decay_norm = decay/decay(1); %normalize the decay curve
    decay_norm(decay_norm==0) = .0001; %remove zeros
    logdecay = log(decay_norm); %get some timing stuff
    [K,s] = polyfit(time_norm, logdecay, 1); %get the linear regression going ayy
    rsqu = 1-s.normr^2/norm(logdecay-mean(logdecay))^2;
    percent = (decay(1)-decay(7))/decay(1);
    res = [-1*K(1) decay(1) percent rsqu];
end