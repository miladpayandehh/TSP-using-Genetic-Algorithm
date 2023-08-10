function PlotSolution(sol,model)

    x=model.x;
    y=model.y;

    sol=[sol sol(1)];
    
    plot(x(sol),y(sol),'k-o','MarkerSize',12,'MarkerFaceColor','y','LineWidth',2);
    axis equal;
    
end