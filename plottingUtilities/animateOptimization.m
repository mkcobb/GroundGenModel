function h  = animateOptimization(tsc)

% Determine the limits on our plots
xLimits = [min(tsc.iterBasisParams.data(:,1,:))...
    max(tsc.iterBasisParams.data(:,1,:))];
yLimits = [min(tsc.iterBasisParams.data(:,2,:))...
    max(tsc.iterBasisParams.data(:,1,:))];

% Plot the estimated response surface
azimuths = linspace(xLimits(1),xLimits(2),100);
zeniths  = linspace(yLimits(1),yLimits(2),100);
[azimuths,zeniths] = meshgrid(azimuths,zeniths);
c = tsc.initBestFitCoefficients.data;
performanceIndexSurf = calculateResponseSurface(c,azimuths,zeniths);
h.responseSurface = surf(azimuths,zeniths,...
    performanceIndexSurf,'EdgeColor','none');
xlabel('Azimuth Sweep Angle')
ylabel('Zenith Sweep Angle')
zlabel('PerformanceIndex')

hold on
h.axes = gca;

% Plot the true response surface
performanceIndexSurfTrue = 100000-100000*(azimuths-50*pi/180).^2-100000*(zeniths-15*pi/180).^2;
h.responseSurface = surf(azimuths,zeniths,...
    performanceIndexSurfTrue,'EdgeColor','none');

% Plot the initial measured performance indices
h.performanceIndices = scatter3(...
    squeeze(tsc.initBasisParameters.data(:,1,:)),...
    squeeze(tsc.initBasisParameters.data(:,2,:)),...
    tsc.initMeasurementVector.data(end,:),...
    'MarkerEdgeColor','r','MarkerFaceColor','k');


% Plot the previous point
h.previousPoint = scatter3(...
    tsc.ilcBasisParamsPrevious.data(1,1),...
    tsc.ilcBasisParamsPrevious.data(1,2),...
    tsc.rlsPerformanceIndex.data(1),'MarkerFaceColor','r');

% Plot the next point
h.nextPoint = scatter3(...
    tsc.ilcBasisParamsNext.data(1,1),...
    tsc.ilcBasisParamsNext.data(1,2),...
    calculateResponseSurface(c,...
    tsc.ilcBasisParamsNext.data(1,1),...
    tsc.ilcBasisParamsNext.data(1,2)),...
    'MarkerFaceColor','g');

% Initialize the scatter that shows all points that have been tested
h.testedPoints = scatter3([],[],[],'Marker','x','MarkerEdgeColor','b');

% Plot the line that connects the start to the end point


% Plot the trust region around the point
h = plotTrustRegion(h,[tsc.ilcBasisParamsPrevious.data(1,1),...
    tsc.ilcBasisParamsPrevious.data(1,2)]);

% Plot the gradient
h = plotGradient(h,...
    [tsc.initBasisParameters.data(1,1,1),...
    tsc.initBasisParameters.data(1,2,1)],tsc.gradient.data(1,:));


% Step through the optimization
for ii = 1:length(tsc.rlsBestFitCoefficientsNext.Time)
    % Update the response surface
    h.responseSurface.ZData = calculateResponseSurface(...
        tsc.rlsBestFitCoefficientsNext.data(ii,:),...
        azimuths,zeniths);
    
    % Add the last start point to the tested data
    h.testedPoints.XData = [h.testedPoints.XData h.previousPoint.XData];
    h.testedPoints.YData = [h.testedPoints.YData h.previousPoint.YData];
    h.testedPoints.ZData = [h.testedPoints.ZData h.previousPoint.ZData];
    
    % Update the start point
    h.previousPoint.XData = tsc.ilcBasisParamsPrevious.data(1,1,ii);
    h.previousPoint.YData = tsc.ilcBasisParamsPrevious.data(1,2,ii);
    h.previousPoint.ZData = tsc.rlsPerformanceIndex.data(ii);
        
    % Update the end point
    h.nextPoint.XData = tsc.ilcBasisParamsNext.data(1,1,ii);
    h.nextPoint.YData = tsc.ilcBasisParamsNext.data(1,2,ii);
    h.nextPoint.ZData = calculateResponseSurface(...
        tsc.rlsBestFitCoefficientsNext.data(ii,:),...
        tsc.ilcBasisParamsNext.data(1,1,ii),...
        tsc.ilcBasisParamsNext.data(1,2,ii));

    % Update the gradient
    h = plotGradient(h,...
    [h.previousPoint.XData,...
    h.previousPoint.YData],tsc.gradient.data(ii,:));

    
    drawnow
    
edit pend

end