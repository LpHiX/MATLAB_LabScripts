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
scatter([ 10166 33459 81432 156480], interpolate(465, x(xIndex - 1), y(xIndex - 1,:), x(xIndex), y(xIndex,:)))

%----------------------------
data = importdata("meshconvergence1D.xlsx");

x = data.data(:,1) ;

f = figure;
f.Position = [650 100 600 400];

for i = 2:5
    hold on
    plot(x,data.data(:,i))
end
xline(66)
hold off

%----------

f = figure;
f.Position = [650 600 600 400];

i = 2:5;
y = data.data(:,i);
xIndex = find(x>=66,1);
scatter([10 21 52 115], interpolate(66, x(xIndex - 1), y(xIndex - 1,:), x(xIndex), y(xIndex,:)))


function result = interpolate(xdesired, x1, y1, x2, y2)
    (xdesired - x1) / (x2 - x1);
    result = (xdesired - x1) / (x2 - x1) * (y2 - y1) + y1;
end

