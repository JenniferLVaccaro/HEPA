function barPlot(NameVector, DataVector)
    %HOW DO YOU MAKE A BAR GRAPH IN MATLAB?
    %input: vectors for the names and data values

    figure('rend', 'painters', 'pos', [10 10 700 550])
    bar(DataVector)
    set(gca, 'XTick', 1:8, 'XTickLabel', '');


    %rotate axis labels by turning them into text objects ::P
    Xt = 1:1:length(NameVector);
    Xl = [1 length(NameVector)];

    ax = axis;      % Current axis limits
    axis(axis);     % Set the axis limit modes (e.g. XLimMode) to manual
    Yl = ax(1);   % Y-axis limits
    % Place the text labels
    t = text(Xt,Yl(1)*ones(1,length(Xt)), NameVector);
    set(t,'HorizontalAlignment','right','VerticalAlignment','top', 'FontSize', 12, 'Rotation',45);

end