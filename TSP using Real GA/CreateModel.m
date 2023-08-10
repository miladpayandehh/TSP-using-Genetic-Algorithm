function model=CreateModel()

    x=[57 36 11 19 76 77 71 33 58 33 6 76 93 38 86 98 40 28 48 68]';
    y=[9 90 42 42 90 95 32 60 24 59 61 11 3 32 43 36 45 52 96 60]';
    
    n=numel(x);
    
    pos=[x y];
    D=pdist2(pos,pos);
    
    model.n=n;
    model.x=x;
    model.y=y;
    model.D=D;
    
end