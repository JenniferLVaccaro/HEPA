function [bins, initialC] = initC(name, b4filt, scantime)
    %Inputs: name = SEMS file name
            %b4filt = time (minutes) before filter is turned on
            %scantime = how long one scan takes, in minutes
    %Function: Makes several useful plots
    
    conc = csvread(name, 56, 92);
    [l w] = size(conc);
    bins = csvread(name, 56, 21, [56, 21, 56, 91]);
    times = transpose(0:scantime:scantime*l-1)-b4filt;            %where l = however many scans we did
    ufp = transpose(sum(transpose(conc(:,1:45))));
    pm1 = transpose(sum(transpose(conc(:,1:end))));
    pm1_1 = transpose(sum(transpose(conc(:,46:end))));
    pm3 = transpose(sum(transpose(conc(:,61:end))));

    conc_avg = [transpose(downsample(transpose(conc(:,1:end-2)), 3, 0) + downsample(transpose(conc(:,1:end-2)), 3, 1) +downsample(transpose(conc), 3, 2))/3 (conc(:,end-1)+conc(:,end))*.5];
    bins_avg = [transpose(downsample(transpose(bins(:,1:end-2)),3,1)) bins(end)];
    filt = [times conc ufp pm1 pm1_1 pm3];
    filt2 = [times conc ufp pm1 pm1_1 pm3];
    %Calculate the k values, initial concentration, % reduction and R^2 values
    %yolo = sems_k_vals(filt(floor(b4filt/scantime):floor(b4filt/scantime+cfm*scantime),:), false);
    yolo2 = sems_k_vals(filt2(floor(b4filt/scantime):end,:), false);
    
   initialC = transpose(yolo2(5:end,2)/max(yolo2(10:end,2)));
end