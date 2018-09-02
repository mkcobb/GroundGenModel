% test script for the resettable timer unit

close all
clc

sim('resettableTimer_th')

figure
subplot(2,1,1)
simout1.plot
ylim([-0.1 1.1])
grid on



subplot(2,1,2)
simout.plot
grid on
ylim([-0.1 2.1])

linkaxes(findall(gcf,'type','axes'),'x')