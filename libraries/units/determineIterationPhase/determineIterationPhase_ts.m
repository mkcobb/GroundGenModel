close all
clc
sim('determineIterationPhase_th')

figure
subplot(3,2,1)
r.plot
grid on

subplot(3,2,3)
az.plot
grid on

subplot(3,2,2)
iterationPhase.plot
grid on
ylim([-0.1 2.1])

subplot(3,2,4)
iterationNumber.plot
grid on

subplot(3,2,6)
iterationReset.plot
grid on
ylim([-0.1 1.1])

linkaxes(findall(gcf,'Type','axes'),'x')