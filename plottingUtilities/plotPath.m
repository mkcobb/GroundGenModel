close all
figure
subplot(3,1,1)
plot(tsc.positionGFS.time,tsc.positionGFS.data(:,1))
grid on

subplot(3,1,2)
plot(tsc.positionGFS.time,tsc.positionGFS.data(:,2))
grid on


subplot(3,1,3)
tsc.iterationPhase.plot
grid on
ylim([0 3])

linkaxes(findall(gcf,'Type','Axes'),'x')


figure
subplot(3,1,1)
tsc.iterationPhase.plot
grid on
ylim([0 3])

subplot(3,1,2)
plot(tsc.time,tsc.targetWaypoint.data(:,1))
grid on

subplot(3,1,3)
plot(tsc.time,tsc.targetWaypoint.data(:,2))
grid on
hold on
plot(tsc.time,tsc.positionGFS.data(:,3))


linkaxes(findall(gcf,'Type','Axes'),'x')

figure
subplot(2,1,1)
plot(tsc.time,tsc.rudderAngleCommand.data)
grid on
hold on
plot(tsc.time,tsc.rudderAngleUpperSaturation.data,'Color','r')
plot(tsc.time,tsc.rudderAngleLowerSaturation.data,'Color','r')

subplot(2,1,2)
tsc.tetherTension.plot
grid on
linkaxes(findall(gcf,'Type','Axes'),'x')


figure
plot3(tsc.positionGFC.data(:,1),...
    tsc.positionGFC.data(:,2),...
    tsc.positionGFC.data(:,3));
grid on
axes square




