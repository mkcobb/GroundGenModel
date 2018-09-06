
figure

subplot(2,1,1)
plot(tsc.gradient.time,...
    tsc.gradient.data(:,1));
grid on

subplot(2,1,2)
plot(tsc.gradient.time,...
    tsc.gradient.data(:,2));
grid on


linkaxes(findall(gcf,'Type','Axes'),'x')