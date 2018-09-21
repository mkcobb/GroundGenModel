figure

subplot(2,1,1)
plot(tsc.basisParameters.Time,...
    squeeze(tsc.basisParameters.data(:,1,:)))
grid on

subplot(2,1,2)
plot(tsc.basisParameters.Time,...
    squeeze(tsc.basisParameters.data(:,2,:)))
grid on

linkaxes(findall(gcf,'Type','Axes'),'x')