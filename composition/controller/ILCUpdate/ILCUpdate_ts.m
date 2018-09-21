close all
clc

sim('ILCUpdate_th')
stopCallback

%%
close all

subplot(3,1,1)
tsc.basisParameters.plot
grid on
hold on

subplot(3,1,2)
tsc.iterBasisParams_norm.plot
grid on

subplot(3,1,3)
tsc.initBasisParams_norm.plot
grid on


linkaxes(findall(gcf,'Type','Axes'),'xy')