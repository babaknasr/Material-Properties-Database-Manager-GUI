%%%%%%%%%%not complete
function newmprop = matdb_reorder(mprop)

[typename, tvar, mstruct] = mattypelist();
% k = 1;
for k=1:length(tvar)
    for j=1:size(mprop.(tvar{k}),2)
        temp = cell(1,size(mstruct.(tvar{k}),2));
        for i=1:size(mstruct.(tvar{k}),1)
            ind = find(strcmpi(mprop.(tvar{k}){1,j}(:,1),mstruct.(tvar{k}){i,1}));
            if ~isempty(ind)
                temp(i,:) = mprop.(tvar{k}){1,j}(ind,:);
            else
                temp(i,:) = mstruct.(tvar{k})(i,:);
            end %if
        end %i
        for i=1:size(mprop.(tvar{k}){1,j},1)
            ind = find(strcmpi(mstruct.(tvar{k})(:,1),mprop.(tvar{k}){1,j}{i,1}));
            if isempty(ind)
                temp(end+1,:) = mprop.(tvar{k}){1,j}(i,:);
            end %if
        end %i
        mprop.(tvar{k}){1,j} = temp;
    end %j
end %k
newmprop = mprop;

