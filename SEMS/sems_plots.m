function res = sems_plots(name, b4filt, scantime, color_marker, cfm)
    %Inputs: name = SEMS file name
            %b4filt = time (minutes) before filter is turned on
            %scantime = how long one scan takes, in minutes
    %Function: Makes several useful plots
    
    conc = csvread(name, 56, 92);
    [l w] = size(conc);
    times = transpose(0:scantime:scantime*l-1)-b4filt;            %where l = however many scans we did
    pm1 = transpose(sum(transpose(conc(:,1:end))));
   plot(cfm*(times(ceil(b4filt/scantime):end)+1.5),pm1(ceil(b4filt/scantime):end)/pm1(ceil(b4filt/scantime)), color_marker);
   res = 0;
end