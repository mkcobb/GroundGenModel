close all

set(0,'defaultFigureUnits','Normalized')
set(0, 'defaultFigurePosition', [0    0.0463    1.0000    0.8667])% Default figure position for laptop at school
fontSize = 32;
startIndex = 9;

% Extract the data into vectors
azimuths= squeeze(tsc.iterBasisParams_rad.data(:,1,startIndex:end))*(180/pi);
zeniths = squeeze(tsc.iterBasisParams_rad.data(:,2,startIndex:end))*(180/pi);
performanceIndex = squeeze(tsc.iterPerformanceIndex.data(startIndex:end));

% Add the initial conditions on the start
% azimuths = [ctrl.width*pi/180; azimuths];
% zeniths = [ctrl.height*pi/180; zeniths];
% performanceIndex = [tsc.iterPerformanceIndex.data(3); performanceIndex];


%% Figure for basis parameters
figure

subplot(2,1,1)
stairs(azimuths,'LineWidth',2)
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel({'Azimuth Basis','Parameter, $W_i$ [deg]'})

subplot(2,1,2)
stairs(zeniths,'LineWidth',2)
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel({'Zenith Basis','Parameter, $H_i$ [deg]'})

linkaxes(findall(gcf,'Type','Axes'),'x')

saveas(gcf,fullfile(pwd,'output','figures','ExtendedAbstract','BasisParameters.png'))


%% Figure for performance index
figure

stairs(performanceIndex,'LineWidth',2)
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel('Performance Index')

saveas(gcf,fullfile(pwd,'output','figures','ExtendedAbstract','PerformanceIndex.png'))

clearvars azimuths zeniths performanceIndex