classdef ilcEnables_enum < Simulink.IntEnumType
    % MATLAB enumeration class definition generated from template
    %   to track the active child state of ILCUpdate_th/ILCUpdate/ManageILCUpdateTriggers/Chart.
    
    enumeration
        None(0),
		SETTLING(1),
		STARTBUILDINGMATRIX(2),
		STARTBUILDINGVECTOR(3),
		STARTOPTIMIZATION(4),
		FREERUNOPTIMIZATION(5)
    end

    methods (Static)

        function defaultValue = getDefaultValue()
            % GETDEFAULTVALUE  Returns the default enumerated value.
            %   If this method is not defined, the first enumeration is used.
            defaultValue = ilcEnables_enum.None;
        end

        function dScope = getDataScope()
            % GETDATASCOPE  Specifies whether the data type definition should be imported from,
            %               or exported to, a header file during code generation.
            dScope = 'Auto';
        end

        function desc = getDescription()
            % GETDESCRIPTION  Returns a description of the enumeration.
            desc = 'enumeration to track active child state of ILCUpdate_th/ILCUpdate/ManageILCUpdateTriggers/Chart';
        end

        function fileName = getHeaderFile()
            % GETHEADERFILE  Returns path to header file if non-empty.
            fileName = '';
        end

        function flag = addClassNameToEnumNames()
            % ADDCLASSNAMETOENUMNAMES  Indicate whether code generator applies the class name as a prefix
            %                          to the enumeration.
            flag = true;
        end

    end

end
