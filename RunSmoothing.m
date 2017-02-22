function [ SmoothedOutput, PersistentState ] = RunSmoothing( EstimatedParameters, Options, PersistentState )

    CorePath = [ fileparts( which( 'RunSmoothing' ) ) '/Core/' ];
    addpath( CorePath );
    
    SmoothedOutput = {};

    NumParameters = size( EstimatedParameters, 1 );
    NumObservables = size( Options.Data, 1 );
    
    Options = SetDefaultOptions( Options, true );
    
    EstimatedParameters = [ EstimatedParameters; bsxfun( @plus, log( Options.InitialMEStd ), zeros( NumObservables, 1 ) ) ];
        
    EstimatedNu = ~Options.NoTLikelihood && ~Options.DynamicNu;
    if EstimatedNu
        EstimatedParameters( end + 1 ) = log( Options.InitialNu );
    end
    
    error( 'Not yet implemented.' );
    
    rmpath( CorePath );

end
