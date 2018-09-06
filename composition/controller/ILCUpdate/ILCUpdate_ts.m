close all
clc

sim('ILCUpdate_th')
stopCallback

%%

close all

subplot(3,1,1)
tsc.iterationReset.plot
grid on

subplot(3,1,2)
tsc.iterBasisParams.plot
hold on
line(get(gca,'XLim'),90*(pi/180)*[1 1])
line(get(gca,'XLim'),60*(pi/180)*[1 1])

subplot(3,1,3)
tsc.iterPerformanceIndex.plot

linkaxes(findall(gcf,'Type','Axes'),'x')