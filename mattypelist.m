function [name, v, mstruct] = mattypelist()
list = {'Material Properties', 'material_prop' ;
        'Contact Properties',  'contact_prop'  ;
        'Medium Properties',   'medium_prop'   ;
       };
name = list(:,1);
v = list(:,2);
mp = material_properties();
mstruct.(v{1}) = mp.particle_prop(:,1:3);
mstruct.(v{2}) = mp.contact_prop(:,1:3);
mstruct.(v{3}) = mp.medium_prop(:,1:3);
 