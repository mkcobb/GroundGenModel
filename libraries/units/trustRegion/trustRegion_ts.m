close all

vecIn = [-6 3];


sim('trustRegion_th')

line([0 vecIn(1)*pi/180],[0 vecIn(2)*pi/180])
grid on
hold on
line([0 vecOut.data(1)],[0 vecOut.data(2)],'LineWidth',2,'Color','r')
h.patch = patch(ctrl.trustRegionDeltaAzimuth_deg*[1 1 -1 -1 1]*pi/180,...
      ctrl.trustRegionDeltaZenith_deg *[-1 1 1 -1 -1]*pi/180,...
    [0 0.5 0],'FaceAlpha',0.5);

uistack(h.patch,'bottom')