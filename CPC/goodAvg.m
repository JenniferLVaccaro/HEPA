function [avgT, avgC] = goodAvg(T1, C1, T2, C2, cutoffTime)
    %takes two vectors and averages them by matching about the zero point
    zeroIndex1 = find(T1 == 0);
    zeroIndex2 = find(T2 == 0);
    
    %chop the vectors so their zero indices are in the same place, at cutoffTime
    C1 = C1((zeroIndex1 - cutoffTime):end);
    C2 = C2((zeroIndex2 - cutoffTime):end);
    T1 = T1((zeroIndex1 - cutoffTime):end);
    T2 = T2((zeroIndex2 - cutoffTime):end);
    
    %more chop to the same length
    C1 = C1(1:430);
    C2 = C2(1:430);
    T1 = T1(1:430);
    T2 = T2(1:430);
    
    %geometric average
    avgC = (C1.*C2).^.5;
    avgT = T1;
    
    
    
    %plot(T1, C1, T2, C2)
    %hold on
    %plot(avgT, avgC,'r')

end