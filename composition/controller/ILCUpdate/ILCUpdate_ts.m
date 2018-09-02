close all
clc

sim('ILCUpdate_th')
stopCallback

%%
close all
figure

subplot(3,1,1)
tsc.simulationPhase.plot
grid on

subplot(3,1,2)
tsc.basisParameters.plot
grid on

subplot(3,1,3)
tsc.ILCEnables.plot
grid on

linkaxes(findall(gcf,'Type','Axes'),'x')
