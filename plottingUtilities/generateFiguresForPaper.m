function generateFiguresForPaper(fileName,tsc,sm)

name = erase(lower(fileName),'.png');

close all

set(0,'defaultFigureUnits','Normalized')
set(0, 'defaultFigurePosition', [0    0.0463    1.0000    0.8667])% Default figure position for laptop at school
fontSize = 36;
startIndex = 8;

% Extract the data into vectors
azimuths= squeeze(tsc.iterBasisParams_rad.data(:,1,startIndex:end))*(180/pi);
zeniths = squeeze(tsc.iterBasisParams_rad.data(:,2,startIndex:end))*(180/pi);
performanceIndex = squeeze(tsc.iterPerformanceIndex.data(startIndex:end));
performanceIndexComponents = squeeze(tsc.iterPerformanceIndexComponents.data(startIndex:end,:));

%% Figure for basis parameters
figure

subplot(2,1,1)
stairs(azimuths,'LineWidth',2,...
    'Color','k')
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel({'Azimuth Basis','Parameter,','$W_i$ [deg]'})

subplot(2,1,2)
stairs(zeniths,'LineWidth',2,...
    'Color','k')
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel({'Zenith Basis','Parameter,','$H_i$ [deg]'})
% title(fileName,'Interpreter','none')

linkaxes(findall(gcf,'Type','Axes'),'x')


saveas(gcf,fullfile(fileparts(fileparts(which(mfilename))),'output','figures','paper',['BasisParameters_',name,'.png']))


%% Figure for performance index
figure

stairs(performanceIndex/1000,'LineWidth',2,...
    'Color','k')
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel('Performance Index, $J$ [kW]')
% title(fileName,'Interpreter','none')

saveas(gcf,fullfile(fileparts(fileparts(which(mfilename))),'output','figures','paper',['PerformanceIndex_',name,'.png']))

%% Figure for mean power

figure
stairs(performanceIndexComponents(:,1)/1000,'LineWidth',2,...
    'Color','k')
grid on
set(gca,'FontSize',fontSize)
xlabel('Iteration Number')
ylabel({'Mean Power','[kW per Iteration]'})
% title(fileName,'Interpreter','none')

saveas(gcf,fullfile(fileparts(fileparts(which(mfilename))),'output','figures','paper',['MeanPower_',name,'.png']))

%% Figure for spool speed, tension, and power, during first iteration, and last
figure
firstLapTetherSpeed = tsc.tetherSpeedCommand.data(tsc.iterationNumber.data==3);
firstLapTime = sm.Ts*[0:length(firstLapTetherSpeed)-1];
lastLapTetherSpeed  = tsc.tetherSpeedCommand.data(tsc.iterationNumber.data == max(tsc.iterationNumber.data)-1);
lastLapTime = sm.Ts*[0:length(lastLapTetherSpeed)-1];

h.ax1 = subplot(3,1,1);
h.firstLapTetherSpeed = plot(firstLapTime,firstLapTetherSpeed,...
    'LineWidth',2,'Color','k','LineStyle','-','DisplayName','First Lap');
hold on
box off
h.lastLapTetherSpeed  = plot(lastLapTime,lastLapTetherSpeed,...
    'LineWidth',2,'Color','k','LineStyle','--','DisplayName','Last Lap');
xlim([min(lastLapTime),max([firstLapTime lastLapTime])])
xlabel('Time, t [s]')
ylabel({'Tether','Release','Speed','$\dot{r}(t)$ [m s$^{-1}$]'})
% title(fileName,'Interpreter','none')
h.legend = legend;
set(gca,'FontSize',30)
set(h.legend,'FontSize',fontSize);
set(h.legend,'Position',h.legend.Position+[0 -0.2 0 0])


firstLapTetherTension = tsc.tetherTension.data(tsc.iterationNumber.data==3)./10^6;
firstLapTime = sm.Ts*[0:length(firstLapTetherTension)-1];
lastLapTetherTension  = tsc.tetherTension.data(tsc.iterationNumber.data == max(tsc.iterationNumber.data)-1)./10^6;
lastLapTime = sm.Ts*[0:length(lastLapTetherTension)-1];

h.ax2 = subplot(3,1,2);
h.firstLapTetherTension = plot(firstLapTime,firstLapTetherTension,...
    'LineWidth',2,'Color','k','LineStyle','-','DisplayName','First Lap');
hold on
box off
h.lastLapTetherTension  = plot(lastLapTime,lastLapTetherTension,...
    'LineWidth',2,'Color','k','LineStyle','--','DisplayName','Last Lap');
xlim([min(lastLapTime),max([firstLapTime lastLapTime])])
xlabel('Time, t [s]')
ylabel({'Tether Tension','$T(t)$ [MN]'})
set(gca,'FontSize',30)



firstLappower = tsc.power.data(tsc.iterationNumber.data==3);
firstLapTime = sm.Ts*[0:length(firstLappower)-1];
lastLappower  = tsc.power.data(tsc.iterationNumber.data ...
    == max(tsc.iterationNumber.data)-1);
lastLapTime = sm.Ts*[0:length(lastLappower)-1];

h.ax3 = subplot(3,1,3);
h.firstLappower = plot(firstLapTime,firstLappower/1000,...
    'LineWidth',2,'Color','k','LineStyle','-','DisplayName','First Lap');
hold on
box off
h.lastLappower  = plot(lastLapTime,lastLappower/1000,...
    'LineWidth',2,'Color','k','LineStyle','--','DisplayName','Last Lap');

xlim([min(lastLapTime),max([firstLapTime lastLapTime])])
xlabel('Time, t [s]')
ylabel({'Power','$P(t)$ [kW]'})
set(gca,'FontSize',30)

linkaxes([h.ax1 h.ax2 h.ax3],'x')

set(findall(gcf,'Type','Axes'),'Color','none')

saveas(gcf,fullfile(fileparts(fileparts(which(mfilename))),'output','figures','paper',['PowerOverview_',name,'.png']))

%% Figure for path

firstLapPositionGFC = tsc.positionGFC.data(tsc.iterationNumber.data==3,:);
lastLapPositionGFC  = tsc.positionGFC.data(...
    tsc.iterationNumber.data == max(tsc.iterationNumber.data)-1,:);

figure
plot3(firstLapPositionGFC(:,1),firstLapPositionGFC(:,2),firstLapPositionGFC(:,3),...
    'LineWidth',2,'Color','k','LineStyle','-','DisplayName','First Lap');
grid on
hold on
plot3(lastLapPositionGFC(:,1),lastLapPositionGFC(:,2),lastLapPositionGFC(:,3),...
    'LineWidth',2,'Color','k','LineStyle','--','DisplayName','Last Lap');

xlabel('$x_G$, [m]','FontSize',fontSize)
ylabel('$y_G$, [m]','FontSize',fontSize)
zlabel('$z_G$, [m]','FontSize',fontSize)

set(gca,'FontSize',fontSize)

axis square
axis equal
h.legend = legend;
set(h.legend,'Units','Normalized','Position',[0.35 0.75 0.2 0.1])

view([75 40])

saveas(gcf,fullfile(fileparts(fileparts(which(mfilename))),'output','figures','paper',['Path_',name,'.png']))

% Crop all the images we just generated
cropImages(fullfile(fileparts(fileparts(which(mfilename))),'output','figures','paper'))



end