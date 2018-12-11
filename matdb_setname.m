function newmprop = matdb_setname(mprop)
[typename, tvar, mstruct] = mattypelist();

for i=1:length(typename)
    for j=1:size(mprop.(tvar{i}),2)
        if strcmpi(typename{i},'Material Properties') ||...
                strcmpi(typename{i},'Medium Properties')
            name = mprop.(tvar{i}){1,j}{strcmpi(mprop.(tvar{i}){1,j}(:,1),'Name'),2};
            ref =  mprop.(tvar{i}){1,j}{strcmpi(mprop.(tvar{i}){1,j}(:,1),...
                'Reference'),2};
            mprop.(tvar{i}){2,j} = [name, '[', ref, ']'];
        end %if
        if strcmpi(typename{i},'Contact Properties')
            pname = mprop.(tvar{i}){1,j}{strcmpi(mprop.(tvar{i}){1,j}(:,1),...
                'Particle Name'),2};
            sname = mprop.(tvar{i}){1,j}{strcmpi(mprop.(tvar{i}){1,j}(:,1),...
                'Substrate Name'),2};
            mname = mprop.(tvar{i}){1,j}{strcmpi(mprop.(tvar{i}){1,j}(:,1),...
                'Medium Name'),2};
            ref =  mprop.(tvar{i}){1,j}{strcmpi(mprop.(tvar{i}){1,j}(:,1),...
                'Reference'),2};
            mprop.(tvar{i}){2,j} = [pname '-' sname '(' mname ')[' ref ']'];
        end %if
    end %j
%     [~,ind] = sort(mprop.(tvar{i})(2,:));
%     temp = mprop.(tvar{i})(:,ind);
%     mprop.(tvar{i}) = temp;
end %i
newmprop = mprop;
