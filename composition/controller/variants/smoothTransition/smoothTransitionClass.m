classdef smoothTransitionClass < handle
    properties (Constant)
        % What to name the object in the workspace
        defaultInstanceName = 'ctrl';
    end
    properties
        % Waypoints Settings
        ic                  = 'FirstTry';       % which set of initial conditions to use, if 'userspecified' then must set width and height manually in calling script
        num                 = 10^3;         % number of angles used to parameterize the path
        meanElevation       = 30;           % mean course elevation
        lookAheadPercent    = 0.025;        % percentage of total path length that the carrot is ahead
        localSearchPercent  = 0.025         % percentage of the course to search for the closest point on the path, centered on previous closest point.
        
        % Rudder Controller
        kr1  = 100; % Controller gain
        kr2  = 100; % Controller gain
        tauR = 0.0500;  % Ref model time const: 1/(tauR*s+1)^2
        
        numSettlingLaps = 3;                 % Number of laps before starting tether reel out
        numSimulationLaps = 20;               % Number of laps to run during reel out
        %         tetherReelOutFilterTimeConstant = 0.01; % Time constant used to filter reel out command
        reelSpeedTimeConstant = 1; % Time constant used to filter speed commands sent to
        
        % Upper and lower distance limits for reel in/out
        reelLowerLim = 40;
        reelUpperLim = 100;
        reelInWingAlpha   = -0.035*180/pi; % Target angle of attack for wing on reel-in [deg]
        reelInRudderAlpha = 0 % Target angle of attack for rudder on reel-in [deg]
        reelInSpeed = 3;
        reelInZenithOffsetDeg = 20;  % how far above (in zenith) the target waypoint is in reel-in.
        reelOutAlpha_deg = 5.7; % Angle of attack used during reel out (crosswind)
        
        % PerformanceIndexSettings
        penaltyWeight = 25000; % weight applied to the second term of the performance index
        
        % RLS settings
        gridAzimuth_deg = 5; % Azimuth grid spacing used in initialization
        gridZenith_deg = 2; % Zenith grid spacing used in initialization
        trustRegionDeltaAzimuth_deg = 5;
        trustRegionDeltaZenith_deg  = 5;
        learningGain = 5e-9;
        forgettingFactor = 0.95;
        persistenExcitationAzimuth_deg = 0.000000001;
        persistenExcitationZenith_deg  = 0.000000001;
        
    end
    
    properties (Dependent = false) % Property value is stored in object
        height                           % Initial course width
        width                            % Initial course height
        waypointAngles                   % Parametric angles which define waypoints
        localSearchIndexOffsetVector     % Angular distance to look ahead for the path following.
        lookAheadIndexOffset             % Number of indices ahead that the carrot is
        firstOptimizationIterationNum    % Have to calculate this because the if block doesn't accept "+" operator
        classPath                        % Path to this class file
        numInitializationLaps            % Number of laps to fly for initialization
        initializationGridCoordinates    % Points in design space (relative to the initial design) used for initialization
        initialReelSpeed                 % Initial reel out speed
        initialBasisParameters           % Initial basis parameters, in degrees
    end
    
    methods
        function val = get.initialReelSpeed(obj)
            vFlow = 1.5; % Assume a 1.5 m/s flow speed
            initZenith = pi/2; % Assume you're starting at an initial zenith of 45 degrees
            val = vFlow^2/(3*sin(initZenith));
        end
        function val = get.initializationGridCoordinates(obj)
            val = [obj.width  + obj.gridAzimuth_deg*[0 1 0 -1 0]',...
                obj.height + obj.gridZenith_deg* [0 0 1 0 -1]'];
        end
        function val = get.numInitializationLaps(obj)
           val = size(obj.initializationGridCoordinates,1);
        end
        function val = get.classPath(obj)
           val = fileparts(which(mfilename));
        end
        function val = get.firstOptimizationIterationNum(obj)
            val = obj.numInitializationLaps+obj.numSettlingLaps+1;
        end
        function val = get.lookAheadIndexOffset(obj)
            val = round(obj.num*obj.lookAheadPercent);
        end
        function val = get.localSearchIndexOffsetVector(obj)
            val = 0:round(obj.num*obj.localSearchPercent);
        end
        function val = get.initialBasisParameters(obj)
            switch lower(obj.ic)
                case 'firsttry'
                    val = [90 20];
            end
        end
        function val = get.height(obj)
            val = obj.initialBasisParameters(2);
        end
        function val = get.width(obj)
           val = obj.initialBasisParameters(1);
        end
        function val = get.waypointAngles(obj)
            angles = linspace((3/2)*pi,(3/2)*pi+2*pi,obj.num+1);
            val = angles(1:end-1);
        end
    end
end