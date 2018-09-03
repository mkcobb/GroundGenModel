function h  = animateOptimization(tsc)

% Determine the limits on our plots
xLimits = [min(tsc.basisParameters.data(:,1))...
    max(tsc.basisParameters.data(:,1))];
yLimits = [min(tsc.basisParameters.data(:,2))...
    max(tsc.basisParameters.data(:,2))];

azimuths = linspace(xLimits(1),xLimits(2),100);
zeniths  = linspace(yLimits(1),yLimits(2),100);

[azimuths,zeniths] = meshgrid(azimuths,zeniths);

% Plot the optial response surface
c = tsc.initBestFitCoefficients.data(:,:,1);
performanceIndexSurf = calculateResponseSurface(c,azimuths,zeniths);
h.responseSurface = surf(azimuths,zeniths,...
    calculateResponseSurface(c,azimuths,zeniths),'EdgeColor','none');
hold on

% Plot the optial measured performance indices

h.performanceIndices = scatter3(...
    squeeze(tsc.initBasisParameters.data(1,1,:)),...
    squeeze(tsc.initBasisParameters.data(1,2,:)),...
    tsc.initMeasurementVector.data(end,:));



end