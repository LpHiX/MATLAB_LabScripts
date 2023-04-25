clear; clc; clf; close all;
data = importdata("meshconvergence.xlsx");

x = data.data(:,1) ;

f = figure;
f.Position = [900 600 700 400];

for i = 3:6
    hold on
    plot(x,data.data(:,i))
end
xline(465)
hold off

%----------

f = figure;
f.Position = [100 600 700 400];

i = 3:6;
y = data.data(:,i);
xIndex = find(x>=465,1);
scatter([ 10166 33459 81432 156480], [y(xIndex,:)])

%----------------------------

data2 = importdata("loadingincrement.xlsx");
x2 = data2.data(:,1);

f = figure;
f.Position = [900 100 700 400];

for i = 2:9
    hold on
    plot(x2,data2.data(:,i))
end
xline(465)
hold off

%----------------

f = figure;
f.Position = [100 100 700 400];

i = 1:8;
y = data2.data(:,i+1);
xIndex = find(x2>=465,1);
scatter([0 i * 5], [0 y(xIndex,:)])