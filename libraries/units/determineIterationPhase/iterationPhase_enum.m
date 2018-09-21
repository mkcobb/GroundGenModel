classdef iterationPhase_enum < Simulink.IntEnumType
    % MATLAB enumeration class definition generated from template
    %   to track the active child state of determineIterationPhase_ul/CalculateIterationPhase/Chart.
    
    enumeration
        None(0),
		REELOUT_CWOFF(1),
        REELOUT_CWON(2),
		REELIN(3)
    end

    methods (Static)

        function defaultValue = getDefaultValue()
            % GETDEFAULTVALUE  Returns the default enumerated value.
            %   If this method is not defined, the first enumeration is used.
            defaultValue = iterationPhase_enum.None;
        end

        function dScope = getDataScope()
            % GETDATASCOPE  Specifies whether the data type definition should be imported from,
            %               or exported to, a header file during code generation.
            dScope = 'Auto';
        end

        function desc = getDescription()
            % GETDESCRIPTION  Returns a description of the enumeration.
            desc = 'enumeration to track active child state of determineIterationPhase_ul/CalculateIterationPhase/Chart';
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
