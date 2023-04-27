clear; clc; clf; close all

graphLoadUnload( ... %xload, yload, err_load, xunload, yunload, err_unload, datalabel, xlab, ylab, theory, legendloc
    [0	24	50	75	101	124	148	174	199	224	249	275	300], ...
    [0	-0.017	-0.030833333	-0.042	-0.056	-0.068333333	-0.085	-0.097	-0.110833333	-0.125	-0.136	-0.149	-0.163], ...
    0.5 * ones(1,13) * 0.001, ...
    2 * ones(1,13) * 0.001, ...
    'Loading deflection', ...
    [1	25	50	75	100	125	150	175	200	225	250	276	299],...
    [-0.007833333	-0.023333333	-0.038	-0.05	-0.064	-0.076	-0.0905	-0.101	-0.116	-0.127	-0.1395	-0.15	-0.161666667],...
    0.5 * ones(1,13) * 0.001, ...
    2 * ones(1,13) * 0.001, ...
    'Unloading deflection', ...
    'Force Applied (N)', ...
    'Deflection (mm)', ...
    [-5.828*230/195000/36 0],...
    'southwest',9, ...
    "Statically Determinate Deflection vs Force Applied");

detLoad = [
    -2.666666667	22.33333333	49.33333333	71.83333333	98.2	123.1666667	147.6666667	173.1666667	198	220.6666667	247.5	276	299.6666667;
    2	35	72.16666667	106.8333333	144.2	177	213.3333333	249.3333333	286	322.6666667	357.3333333	397.3333333	434.6666667;
    3.166666667	-21	-45	-68.5	-92.4	-115	-138.3333333	-163.6666667	-187.5	-213.3333333	-235.3333333	-261.3333333	-285;
    0.333333333	-24.5	-47.16666667	-70.5	-97.6	-119.3333333	-143.5	-167	-193	-215.3333333	-241.3333333	-265.6666667	-292.6666667;
    -0.333333333	-51	-101	-150.1666667	-200.2	-247	-299.1666667	-348.6666667	-397.6666667	-450.1666667	-498.6666667	-554.1666667	-605.6666667;
    -5	-5	-6.666666667	-6.666666667	-5.2	-7	-5.333333333	-10	-9	-9	-9.833333333	-11.33333333	-11.66666667;
    2.666666667	35.66666667	71.16666667	107.3333333	140.6	176	209.1666667	246.8333333	280.8333333	317.6666667	351	390.6666667	425;
    1	1.5	-0.166666667	0.833333333	0	0	0.666666667	0.833333333	1	1.833333333	0.833333333	0.166666667	0.666666667;
    ];
detUnload = [
    -0.333333333	26	50.16666667	74.66666667	99.5	125	150.8333333	175.1666667	199.5	222.3333333	249.8333333	273.6666667	299;
    2.166666667	37.33333333	73.83333333	107	142.8333333	181.6666667	216.3333333	251.8333333	287.3333333	324.1666667	361.5	397	431.5;
    2.333333333	-22.66666667	-45.5	-70.5	-93.66666667	-117.8333333	-141.1666667	-164.6666667	-189	-213	-237	-262.1666667	-284.5;
    0	-26.33333333	-49.16666667	-71.83333333	-96.5	-120	-144.3333333	-170	-193.5	-217.1666667	-241.6666667	-269	-289.8333333;
    -8	-56.66666667	-105.8333333	-156.1666667	-203	-255.3333333	-302.5	-354	-404	-456.1666667	-504	-556	-602.1666667;
    -5.166666667	-6.666666667	-5.333333333	-6.166666667	-6.333333333	-6.833333333	-7	-8.333333333	-8	-10.5	-10.16666667	-11.83333333	-11.83333333;
    4	40	74.83333333	106.8333333	142.3333333	177.6666667	213.6666667	248.6666667	285.6666667	320.1666667	354.6666667	391.3333333	423.1666667;
    0.5	1.333333333	1.5	1.833333333	1	1.833333333	1.5	0.833333333	0.333333333	0.5	1.333333333	0.333333333	1.166666667;
    ];
detPred = [1 sqrt(2) -1 -1 -2 0 sqrt(2) 0];

for i = 1:8
    graphLoadUnload( ... xload, yload, err_load, xunload, yunload, err_unload, datalabel, xlab, ylab, theory
        [0	24	50	75	101	124	148	174	199	224	249	275	300], ...
        detLoad(i,:), ...
        0.5 * ones(1,13), ...
        2 * ones(1,13), ...
        'Loading strain', ...
        [1	25	50	75	100	125	150	175	200	225	250	276	299],...
        detUnload(i,:), ...
        0.5 * ones(1,13), ...
        2 * ones(1,13), ...
        "Unloading strain", ...
        'Force applied (N)', ...
        'Bar tension (N)', ...
        [detPred(i) 0],...
        'southwest',i, ...
        "Statically Determinate Tension vs Force Applied for Member " + num2str(i));
end
%%Indeterminant

graphLoadUnload( ... %xload, yload, err_load, xunload, yunload, err_unload, datalabel, xlab, ylab, theory, legendloc
    [0	24	49	73	99	125	149	174	197	223	251	274	299], ...
    [0	-0.017	-0.024	-0.036	-0.047666667	-0.06	-0.071	-0.080666667	-0.092	-0.102	-0.112	-0.121166667	-0.13], ...
    0.5 * ones(1,13) * 0.001, ...
    2 * ones(1,13) * 0.001, ...
    'Loading deflection', ...
    [302	274	249	225	200	176	152	126	99	74.83333333	49.66666667	26.33333333	0.166666667],...
    [-0.133	-0.123	-0.115	-0.105	-0.096166667	-0.087	-0.077	-0.067	-0.055	-0.044	-0.0325	-0.02	-0.005],...
    0.5 * ones(1,13) * 0.001, ...
    2 * ones(1,13) * 0.001, ...
    'Unloading deflection', ...
    'Force Applied (N)', ...
    'Deflection (mm)', ...
    [(-sqrt(2)-2)*230/195000/36 0],...
    'southwest',9, ...
    "Statically Indeterminate Deflection vs Force Applied");

indetLoad = [
    -1.5	22.33333333	62.16666667	94.33333333	128.6666667	160.8333333	193.5	227.1666667	258.5	294	331	363	395.5;
    -2	35	68	101.6666667	139.8333333	174.8333333	211.6666667	248.6666667	281.1666667	321	358.3333333	390.6666667	427.6666667;
    7.166666667	-21	-41.5	-62.66666667	-87.16666667	-112.3333333	-134.5	-159.3333333	-182.6666667	-206.8333333	-233.6666667	-255.5	-279.3333333;
    -1	-24.5	-34.66666667	-51.33333333	-68.83333333	-84.5	-101.1666667	-119.5	-133.3333333	-150.6666667	-166	-184	-198.3333333;
    -3.166666667	-51	-85.33333333	-125	-170.1666667	-212	-252	-293.1666667	-333.3333333	-376.6666667	-421.1666667	-459.8333333	-501.1666667;
    -0.333333333	-5	12.16666667	18.5	25.16666667	32	38.83333333	44	53	60.66666667	67.83333333	75	81.66666667;
    4	35.66666667	51.33333333	75	100.6666667	124.8333333	148	173	194.1666667	219.3333333	242	265	287.6666667;
    0.666666667	1.5	-21.83333333	-31.33333333	-44.83333333	-55.5	-65.83333333	-78.5	-88.66666667	-100.8333333	-115.3333333	-127	-139.1666667;
];
indetUnload = [
    399	364.5	327.6666667	297	261.3333333	228.8333333	197.6666667	163.3333333	128.6666667	95	61.66666667	32.5	-1.666666667;
    430.8333333	392.1666667	358.3333333	320.5	285.6666667	250.5	215.8333333	178.8333333	143.1666667	107	70	37.5	-0.666666667;
    -281.8333333	-256.3333333	-231.5	-208.3333333	-187	-162	-139.8333333	-113.6666667	-90.33333333	-66	-41.16666667	-19.5	6.333333333;
    -198	-182.1666667	-165.5	-153.3333333	-136.6666667	-122	-107.3333333	-89.16666667	-72.83333333	-56.5	-39.16666667	-22.66666667	-4.333333333;
    -506.8333333	-460.8333333	-421.5	-381.8333333	-342.5	-302	-263.8333333	-219.6666667	-175.8333333	-134.8333333	-92.66666667	-53.66666667	-9.833333333;
    82.66666667	75	69.33333333	59.83333333	52.5	45.5	39.16666667	31.16666667	25.16666667	17	11.66666667	6	-1;
    290.6666667	265	242.1666667	220.6666667	201	177.8333333	157.3333333	132.1666667	105.3333333	82.83333333	59.33333333	36	9.166666667;
    -140.1666667	-125.5	-113.1666667	-101.1666667	-87.33333333	-74.16666667	-61.33333333	-48.5	-38.33333333	-27.83333333	-15.16666667	-5.666666667	4;
    ];
detPred = [1.5 sqrt(2) -1 -0.5 -1.5 0.5 sqrt(2)/2 -sqrt(2)/2];

for i = 1:8
    graphLoadUnload( ... xload, yload, err_load, xunload, yunload, err_unload, datalabel, xlab, ylab, theory
        [0	24	49	73	99	125	149	174	197	223	251	274	299], ...
        indetLoad(i,:), ...
        0.5 * ones(1,13), ...
        2 * ones(1,13), ...
        'Loading strain', ...
        [302	274	249	225	200	176	152	126	99 74.83333333	49.66666667	26.33333333	0.166666667],...
        indetUnload(i,:), ...
        0.5 * ones(1,13), ...
        2 * ones(1,13), ...
        "Unloading strain", ...
        'Force applied (N)', ...
        'Bar tension (N)', ...
        [detPred(i) 0],...
        'southwest', i, ...
        "Statically Indeterminate Tension vs Force Applied for Member " + num2str(i));
end

function result = drawGraph(x, y, err_y, datalabel, xlab, ylab, theory)
    
    bestfitline = polyfit(x,y,1);

    fig = figure;
    fig.Position(1:2) = [575, 100];
    figure(fig);

    errorbar(x, y, err_y, 'xb','DisplayName', datalabel)
    hold on

    sum_of_squares = sum((y-mean(y)).^2);
    sum_of_squares_of_residuals = sum((polyval(bestfitline, x)).^2);
    Rsquared = 1 - sum_of_squares_of_residuals/sum_of_squares;

    plot(x, polyval(bestfitline,x), '-r','DisplayName', ...
        ['Linear best fit $R^2=' num2str(Rsquared) '$ ' newline...
        '$y=' num2str(bestfitline(1)) 'x +' num2str(bestfitline(2)) '$']);
    plot(x, polyval(theory,x), '-b','DisplayName', "Theoretical Line");

    xlabel(xlab,'Interpreter','latex','fontweight','bold','fontsize',16')
    ylabel(ylab, 'Interpreter','latex','fontweight','bold','fontsize',16')
    grid on
    legend('Location','northwest', 'Interpreter','latex')
    
    hold off
    result = 1;
    printf("hi")
end

function result = graphLoadUnload(xload, yload, xerr_load, err_load, label_load, xunload, yunload, xerr_unload, err_unload, label_unload, xlab, ylab, theory, legendloc, xpos, tit)
    
    loadfit = polyfit(xload,yload,1);
    unloadfit = polyfit(xunload,yunload,1);

    fig = figure;
    fig.Position(1:4) = [mod(xpos-1,4) * 410, 70 + floor((xpos-1) / 4) * 50, 800, 800];
    figure(fig);

    errorbar(xload, yload, err_load, err_load, xerr_load, xerr_load, 'x','DisplayName', label_load, color=[0.6 0.4 0.6])
    hold on
    errorbar(xunload, yunload, err_unload, err_unload, xerr_unload, xerr_unload, 'x','DisplayName', label_unload, color=[0.2 0.7 0.6])
    
    loadr = rsquared(yload, polyval(loadfit, xload));
    unloadr = rsquared(yunload, polyval(unloadfit, xunload));

    plot(xload, polyval(loadfit,xload), '-.m','DisplayName', ...
        ['Loading best fit $R^2=' num2str(loadr) '$ ' newline...
        '$y=' num2str(loadfit(1)) 'x +' num2str(loadfit(2)) '$']);
    plot(xunload, polyval(unloadfit,xunload), '-.','DisplayName', ...
        ['Unloading best fit $R^2=' num2str(unloadr) '$ ' newline...
        '$y=' num2str(unloadfit(1)) 'x +' num2str(unloadfit(2)) '$'],color=[0.2 0.5 0.6]);

    plot(xload, polyval(theory,xload), '--k','DisplayName', "Theoretical Line");
    
    theoretical_error = abs(polyval(theory,xload) ./ yload);
    [~, maxindex] = max(xload);

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






% function result = graphLoadUnload(x, y, xerr, err, label_load, xunload, yunload, xerr_unload, err_unload, label_unload, xlab, ylab, theory, legendloc, xpos, tit)
% 
%     loadfit = polyfit(x,y,1);
% 
%     fig = figure;
%     fig.Position(1:4) = [mod(xpos-1,4) * 410, 70 + floor((xpos-1) / 4) * 50, 800, 800];
%     figure(fig);
% 
%     errorbar(x, y, err, xerr, 'x','DisplayName', label_load, color=[0.6 0.4 0.6])
%     hold on
% 
%     loadr = rsquared(y, polyval(loadfit, x));
% 
%     plot(x, polyval(loadfit,x), '-.m','DisplayName', ...
%         ['Loading best fit $R^2=' num2str(loadr) '$ ' newline...
%         '$y=' num2str(loadfit(1)) 'x +' num2str(loadfit(2)) '$']);
% 
%     plot(x, polyval(theory,x), '--k','DisplayName', "Theoretical Line");
% 
%     theoretical_error = abs(polyval(theory,x) ./ y);
%     [~, maxindex] = max(x);
% 
%     xlabel(xlab,'Interpreter','latex','fontweight','bold','fontsize',16')
%     ylabel(ylab, 'Interpreter','latex','fontweight','bold','fontsize',16')
%     grid on
%     legend('Location',legendloc, 'Interpreter','latex')
% 
%     hold off
%     result = 1;
%     title(tit,'Interpreter','latex','fontweight','bold','fontsize',16')
%     fprintf(tit + " " + num2str(100 - theoretical_error(maxindex)* 100) + "%\n")
% end
% function Rsquared = rsquared(data,data_fit)
%     sum_of_squares = sum((data-mean(data)).^2);
%     sum_of_squares_of_residuals = sum((data-data_fit).^2);
%     Rsquared = 1 - sum_of_squares_of_residuals/sum_of_squares;
% end