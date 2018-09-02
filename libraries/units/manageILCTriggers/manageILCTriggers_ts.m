close all
sim('manageILCTriggers_th')

figure
subplot(3,1,1)
simPhase.plot
grid on

subplot(3,1,2)
iterationReset.plot
grid on

subplot(3,1,3)
buildTrigger.plot
grid on
hold on
lsTrigger.plot
rlsTrigger.plot

linkaxes(findall(gcf,'Type','Axes'),'x')
