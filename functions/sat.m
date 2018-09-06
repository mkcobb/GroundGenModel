function out = sat(in,lims)

% Element-wise saturation

out = max(min(in,lims(2)),lims(1));


end