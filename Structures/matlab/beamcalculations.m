close all
LA = 0.135;
LP = 0.465;
LB = 0.575;
P = 40;

E = 200e9;
I = 0.01884 * 0.00294^3 / 12;

A = [
    LA LB 0;
    1 1 1;
    (LB-LA)^3 0 LB^3-LA^2*LB
];
b = P * [LP;1;(LB-LP)^3];
F = A\b;

Ay = F(1);
By = F(2);
Cy = F(3);

x = 0:0.001:0.575;
v = Cy/6 * (x.^3-LA^2.*x) + Ay/6 * (x - LA).^3 - P/6 * (x-LP).^3;
v(x<LP) = Cy/6 * (x(x<LP).^3-LA.^2.*x(x<LP)) + Ay/6 * (x(x<LP) - LA).^3;
v(x<LA) = Cy/6 * (x(x<LA).^3-LA.^2.*x(x<LA));
v = v / E / I;

M = Cy*x + Ay * (x-LA) - P * (x - LP);
M(x<LP) = Cy*x(x<LP) + Ay * (x(x<LP)-LA);
M(x<LA) = Cy*x(x<LA);
strain = M/E/I * 0.00147;

X = [0
67.5
135
190
245
300
355
410
465
520
575
]/1000;
Y = [1.16908E-35
0.225058
-2.52778E-35
-0.740691
-1.79607
-2.88315
-3.71892
-4.02041
-3.5046
-2.02737
-2.6413E-35]/1000;

min(v)
plot(x, v)
%plot(x, strain)
hold on
plot(x, spline(X,Y,x))


legend

x = 0.465;
v = Cy/6 * (x.^3-LA^2.*x) + Ay/6 * (x - LA).^3 - P/6 * (x-LP).^3;
v(x<LP) = Cy/6 * (x(x<LP).^3-LA.^2.*x(x<LP)) + Ay/6 * (x(x<LP) - LA).^3;
v(x<LA) = Cy/6 * (x(x<LA).^3-LA.^2.*x(x<LA));
v = v / E / I
