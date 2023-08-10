function y=Mutate(x)
    
    % Case 1: Using Equal Probabilities
    % METHOD=randi([1 3]);
    
    % Case 2: Using Inequal Proabilities
    pSwap=0.3;
    pReversion=0.45;
    pInsertion=1-pSwap-pReversion;
    METHOD=RouletteWheelSelection([pSwap pReversion pInsertion]);
    
    switch METHOD
        case 1
            y=DoSwap(x);
        
        case 2
            y=DoReversion(x);
            
        case 3
            y=DoInsertion(x);
    end

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