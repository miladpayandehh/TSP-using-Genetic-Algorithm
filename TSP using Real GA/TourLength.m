function [L, sol]=TourLength(q,model)

    % Parse Real Vector q, into a Permutation
    [~, sol]=sort(q);

    D=model.D;

    L=0;
    
    if isempty(sol)
        return;
    end
    
    sol=[sol sol(1)];
    for i=1:numel(sol)-1
        L=L+D(sol(i),sol(i+1));
    end

end