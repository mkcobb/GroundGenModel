close all
sim('SystemModel')

stopCallback

%%
figure
subplot(3,1,1)
tsc.rlsUpdate.plot
grid on

subplot(3,1,2)
tsc.performanceIndex.plot
grid on
hold on
tsc.rlsPerformanceIndex.plot

subplot(3,1,3)
tsc.iterBasisParams.plot
grid on

linkaxes(findall(gcf,'Type','Axes'),'x')