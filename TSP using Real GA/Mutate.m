function y=Mutate(q)
    
    % Case 1: Using Equal Probabilities
    % METHOD=randi([1 3]);
    
    % Case 2: Using Inequal Proabilities
    pSwap=0.3;
    pReversion=0.45;
    pInsertion=1-pSwap-pReversion;
    METHOD=RouletteWheelSelection([pSwap pReversion pInsertion]);
    
    n=numel(q);
    I=1:n;
    
    switch METHOD
        case 1
            J=DoSwap(I);
        
        case 2
            J=DoReversion(I);
            
        case 3
            J=DoInsertion(I);
    end

    y=q(J);
    
end

function y=DoSwap(x)

    n=numel(x);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    y=x;
    y([i1 i2])=x([i2 i1]);

end

function y=DoReversion(x)

    n=numel(x);
    
    i=randsample(n,2);
    i1=min(i);
    i2=max(i);
    
    y=x;
    y(i1:i2)=x(i2:-1:i1);
    
end

function y=DoInsertion(x)

    n=numel(x);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);

    if i1<i2
        %   Actual: 1 ... i1-1 i1 i1+1 ..... i2-1 i2 i2+1 ..... n
        % Modified: 1 ... i1-1 i1+1 ..... i2-1 i2 i1 i2+1 ..... n
        
        y=x([1:i1-1 i1+1:i2 i1 i2+1:end]);
    else
        %   Actual: 1 ... i2-1 i2 i2+1 ..... i1-1 i1 i1+1 ..... n
        % Modified: 1 ... i2-1 i2 i1 i2+1 ..... i1-1 i1+1 ..... n
        
        y=x([1:i2 i1 i2+1:i1-1 i1+1:end]);
    end

end