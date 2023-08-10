function [y1, y2]=Crossover(x1,x2)

    % Determine Chromosome Length
    n=numel(x1);
    
    % Determine Crossover Point
    c=randi([1 n-1]);
    
    % Single-point Crossover
    y1=[x1(1:c) x2(c+1:end)];
    y2=[x2(1:c) x1(c+1:end)];
    
    R1=find(ismember(x2(c+1:end),x1(1:c)))+c;
    R2=find(ismember(x1(c+1:end),x2(1:c)))+c;

    for k=1:numel(R1)
        
        i=R1(k);
        j=R2(k);
        
        temp=y1(i);
        y1(i)=y2(j);
        y2(j)=temp;
        
    end
    
end