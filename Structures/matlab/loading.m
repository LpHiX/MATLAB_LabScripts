clear; clc; clf; close all;
%----------------------------

data2 = importdata("deflection3D.xlsx");
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