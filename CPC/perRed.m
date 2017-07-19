function PR60 = perRed(Time, Conc);
    %finds % reduction at 1 hour after filter turned on
    %takes inputs of matched time and concentration vectors with T=0 at
    %filter turn-on time

    %find sample concentration at 1 hour
    sampleTime = 30*60; %seconds since filter turned on at 30 min
    sampleIndex = find(Time == sampleTime);
    if (length(sampleIndex)==0)
        sampleIndex = length(Time);
    end
    sampleConc = Conc(sampleIndex);

    %find zero concentration when filter is turned on
    zeroIndex = find(Time == 0);
    zeroConc = Conc(zeroIndex);

    PR60 = 1 - sampleConc/zeroConc;
end