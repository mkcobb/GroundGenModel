function labelEnumYAxis(h,enumClass)
%LABELENUMYAXIS Summary of this function goes here
%   labelEnumYAxis(h,enumClass)
%   h is the handle to the axes
%   enumClass is the name of the enumerated class (as a string)

labels = string(enumeration(enumClass));
values = double(enumeration(enumClass));
set(h, 'Ytick',values,'YTickLabel',labels);
end

