close all

subplot(3,1,1)
tsc.performanceIndex.plot
grid on

subplot(3,1,2)
tsc.performanceIndexComponents.plot
grid on

subplot(3,1,3)
tsc.iterationReset.plot
grid on

linkaxes(findall(gcf,'Type','Axes'),'x')