    function k = findK(input,zeroTime)
    %finds the k value of the input
        % C(t) = C_0*e^(-kt)
        % C(t)/C_0 = e^(-kt)
        % ln[C/C_0] = -kt
        % -ln[C/C_0]/t = k
        %chop into decay region only (err on the side of chopping off too much)
        startTime = round(zeroTime/15);
        endTime = startTime + 100;
        decay = input(startTime:endTime);
       
        %FIND K:
        %C(t) = C0*e^(-kt)
        %extract C0 from first element of decay vector
        C0 = decay(1);
        
        decay1 = [];
        time = [];
        %run a for loop that divides each element by t = (-15*i)
        for i = 1:5:length(decay)
            if decay(i)==0
                decay(i) = 0.000001;
            end
            time((i-1)/5 + 1) = 15*i;
            %divide elementwise by C0, leaving e^(-kt)
            %take elementwise ln of normalized decay vector
            decay1((i-1)/5 + 1) = log(decay(i)/C0); %= -kt
            %decay(i) = decay(i)/(-15*i);
        end
        
        [q, s] = polyfit(time, decay1, 1);
        k = -q(1);
        rsqu = 1-s.normr^2/norm(decay1-mean(decay1))^2
        
        
%          figure
%          plot(time, decay1)
%          hold on
%          theory = 0:1600
%          plot(theory, -k*theory + q(2))

    end