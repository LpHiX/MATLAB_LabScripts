clear; clc; clf; close all;
data = importdata("meshstrain3D.xlsx");

x = data.data(:,1) ;

f = figure;
f.Position = [10 100 600 400];
a = data.data(:,3:6);
for i = 3:6
    hold on
    plot(x,data.data(:,i))
end
xline(465)
hold off
scatter(x,data.data(:,3))