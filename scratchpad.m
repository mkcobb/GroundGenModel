close all
clc

tsc.rlsBasisParameters.plot
grid on
hold on
tsc.lsBasisParameters.plot
handles.scatter = scatter(tsc.basisParameters.Time,tsc.basisParameters.data,...
    'Marker','o','MarkerEdgeColor','g','MarkerFaceColor','g');

uistack(handles.scatter,'bottom')
linkaxes(findall(gcf,'Type','Axes'),'x')