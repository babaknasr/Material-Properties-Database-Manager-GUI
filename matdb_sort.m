function newmprop = matdb_sort(mprop)
[typename, tvar, mstruct] = mattypelist();
for i=1:length(typename)
    [~,ind] = sort(mprop.(tvar{i})(2,:));
    temp = mprop.(tvar{i})(:,ind);
    mprop.(tvar{i}) = temp;
end %i
newmprop = mprop;
