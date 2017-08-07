function res = sems_ufp(name, b4filt, scantime, color_marker, cfm)
    %Inputs: name = SEMS file name
            %b4filt = time (minutes) before filter is turned on
            %scantime = how long one scan takes, in minutes
    %Function: Makes several useful plots
    
    conc = csvread(name, 56, 92);
    [l w] = size(conc);
    times = transpose(0:scantime:scantime*l-1)-b4filt;            %where l = however many scans we did
    pm1 = transpose(sum(transpose(conc(:,1:end))));
    ufp = transpose(sum(transpose(conc(:,1:45))));
   plot(cfm*(times(ceil(b4filt/scantime):end)+1.5),ufp(ceil(b4filt/scantime):end)/ufp(ceil(b4filt/scantime)), color_marker);
   res = 0;
end