clear; clc; clf; close all;
data = importdata("meshconvergence.xlsx");

x = data.data(:,1) ;

f = figure;
f.Position = [10 100 600 400];

for i = 3:6
    hold on
    plot(x,data.data(:,i))
end
xline(465)
hold off

%----------

f = figure;
f.Position = [10 600 600 400];

i = 3:6;
y = data.data(:,i);
xIndex = find(x>=465,1);
scatter([ 10166 33459 81432 156480], [y(xIndex,:)])

%----------------------------
data = importdata("meshconvergence1D.xlsx");

x = data.data(:,1) ;

f = figure;
f.Position = [650 100 600 400];

for i = 2:5
    hold on
    plot(x,data.data(:,i))
end
xline(465)
hold off

%----------

f = figure;
f.Position = [650 600 600 400];

i = 2:5;
y = data.data(:,i);
xIndex = find(x>=465,1);
scatter([ 10 21 52 115], [y(xIndex,:)])

%----------------------------

data2 = importdata("loadingincrement.xlsx");
x2 = data2.data(:,1);

f = figure;
f.Position = [1300 100 600 400];

for i = 2:9
    hold on
    plot(x2,data2.data(:,i))
end
xline(465)
hold off

%----------------

f = figure;
f.Position = [1300 600 600 400];

i = 1:8;
y = data2.data(:,i+1);
xIndex = find(x2>=465,1);
scatter([0 i * 5], [0 y(xIndex,:)])

function result = graphLoadUnload(x, y, xerr, err, label_load, xunload, yunload, xerr_unload, err_unload, label_unload, xlab, ylab, theory, legendloc, xpos, tit)
    
    loadfit = polyfit(x,y,1);

    fig = figure;
    fig.Position(1:4) = [mod(xpos-1,4) * 410, 70 + floor((xpos-1) / 4) * 50, 800, 800];
    figure(fig);

    errorbar(x, y, err, xerr, 'x','DisplayName', label_load, color=[0.6 0.4 0.6])
    hold on
    
    loadr = rsquared(y, polyval(loadfit, x));

    plot(x, polyval(loadfit,x), '-.m','DisplayName', ...
        ['Loading best fit $R^2=' num2str(loadr) '$ ' newline...
        '$y=' num2str(loadfit(1)) 'x +' num2str(loadfit(2)) '$']);

    plot(x, polyval(theory,x), '--k','DisplayName', "Theoretical Line");
    
    theoretical_error = abs(polyval(theory,x) ./ y);
    [~, maxindex] = max(x);

    xlabel(xlab,'Interpreter','latex','fontweight','bold','fontsize',16')
    ylabel(ylab, 'Interpreter','latex','fontweight','bold','fontsize',16')
    grid on
    legend('Location',legendloc, 'Interpreter','latex')
    
    hold off
    result = 1;
    title(tit,'Interpreter','latex','fontweight','bold','fontsize',16')
    fprintf(tit + " " + num2str(100 - theoretical_error(maxindex)* 100) + "%\n")
end
function Rsquared = rsquared(data,data_fit)
    sum_of_squares = sum((data-mean(data)).^2);
    sum_of_squares_of_residuals = sum((data-data_fit).^2);
    Rsquared = 1 - sum_of_squares_of_residuals/sum_of_squares;
end