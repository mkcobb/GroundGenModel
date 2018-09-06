% Initialize variants
defaultPerformanceIndex = 2;
variants = {'MeanEnergy','SpatialError'};
% Create variant control variable in the workspace
evalin('base',sprintf('VCPerformanceIndex=%d;',defaultPerformanceIndex))
for ii = 1:length(variants)
    evalin('base',sprintf('variant%s=Simulink.Variant(''VCPerformanceIndex==%d'');',variants{ii},ii))
end
clearvars defaultPerformanceIndex variants ii 
