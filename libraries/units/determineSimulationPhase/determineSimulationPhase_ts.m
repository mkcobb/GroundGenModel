% Script to plot the output of the test harness
close all
clc

sim('determineSimulationPhase_th')

figure
subplot(2,2,1)
radius.plot
grid on
hold on

subplot(2,2,3)
azimuth.plot
grid on
hold on

subplot(2,2,2)
iterPhase.plot
grid on
hold on

subplot(2,2,4)
iterNum.plot
ylabel('Iteration Number')
grid on
hold on


linkaxes(findall(gcf,'Type','Axes'),'x');


figure
subplot(2,1,1)
changebool.plot
grid on

subplot(2,1,2)
simPhaseIndex.plot
grid on

linkaxes(findall(gcf,'Type','Axes'),'x');