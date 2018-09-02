switch strrep(lower(get(gcbh,'actVariant')),' ','')
    case 'reelout'
        evalin('base','VCController = 1;');
        reelOut_init;
    case 'reelin&out'
        evalin('base','VCController = 2;');
        reelInOut_init;
    case 'smoothtransition'
        evalin('base','VCController = 3;');
        smoothTransition_init;
end