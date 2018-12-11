function mp = material_properties()

mp.particle_prop = {'Name'          , '', ''     , 'pname' ;
                 'Young''s Modulus', NaN, 'Pa'   , 'E1'    ;
                 'Poisson''s Ratio', NaN, ''     , 'nu1'   ;
                 'Density'         , NaN, 'kg/m3', 'rho_p' ;
                 'Surface Energy'  , NaN, 'J/m2' , 'gamma1';
                 'Hamaker Constant', NaN, 'J'    , 'A11'   ;
                 'Reference'       , '' , ''     , 'pref'  ;
				 'Description'     , '' , ''     , 'descr' ;
                };

mp.substrate_prop = {'Name'         , '' , ''     , 'sname' ;
                  'Young''s Modulus', NaN, 'Pa'   , 'E2'    ;
                  'Poisson''s Ratio', NaN, ''     , 'nu2'   ;
                  'Density'         , NaN, 'kg/m3', 'rho_s' ;
                  'Surface Energy'  , NaN, 'J/m2' , 'gamma2';
                  'Hamaker Constant', NaN, 'J'    , 'A22'   ;
                  'Reference'       , '' , ''     , 'sref'  ;
				  'Description'     , '' , ''     , 'descr' ;
                 };

mp.medium_prop = {'Name'            , '' , ''      , 'mname';
               'Density'            , NaN, 'kg/m3' , 'rho'  ;
               'Kinematic Viscosity', NaN, 'm2s-1' , 'nu'   ;
               'Temperature'        , NaN, 'K'     , 'T'    ;
               'Relative Humidity'  , NaN, '%'     , 'RH'   ;
               'Hamaker Constant'   , NaN, 'J'     , 'A33'  ;
               'Mean Free Path'     , NaN, 'm'    , 'lambda';
               'Reference'          , '' , ''      , 'mref' ;
			   'Description'        , '' , ''     , 'descr' ;
              };
mp.contact_prop = {'Particle Name'    , '' , ''    , 'pname'  ;
                'Substrate Name'      , '' , ''    , 'sname'  ;
                'Medium Name'         , '' , ''    , 'mname'  ;
                'Work of Adhesion'    , NaN, 'J/m2', 'Wa'     ;
                'Surface Energy'      , NaN, 'J/m2', 'gamma12';
                'Hamaker Constant'    , NaN, 'J'   , 'A'      ;
                'Friction Coefficient', NaN, ''    , 'mus'    ;
                'Reference'           , '' , ''    , 'cref'   ;
				 'Description'        , '' , ''    , 'descr'  ;
               };

