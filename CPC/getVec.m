function [Time, Concentration] = getVec(Vector, timeTilEnd)
    %creates timestamp and concentration vectors for a parsed CSV file
    zeroTime = length(Vector)*15 - timeTilEnd*60;

    Time = zeros(1, 500);
    Concentration = zeros(1, 500);
    for i=1:500
        %add timestamps 15 seconds apart as the first column
        %first column of Vector is concentration and that's all we need
        Time(i) = (i-1)*15;
        try
            Concentration(i) = Vector(i,1);
        catch insufficientLength
            Concentration(i) = 0;
        end

    end

    Time = Time - zeroTime;
end