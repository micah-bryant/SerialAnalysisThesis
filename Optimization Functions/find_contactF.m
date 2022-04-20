function contacts = find_contactF(x,A0,a,curv, L, C)
    %function will hold contact location constant in EB model and solve for 
        %A (F/EI) using nonlinear contrained solver
    %inputs: sensor locations on x-axis, F/EI, initial contact location,
        %sensor measurements in curvature, current length of robot,
        %curvature from pressure mapping
    %outputs: updated contact location

    %set resting curvature to 0 if no actuator active
    if nargin<6, C = 0; end

    %find which sensors have been everted in the experiment
    idx = find(x < L);
    fun = @(contact) EB_costF(contact,a, x(idx), curv(idx),C);
    x0 = A0;
    Aeq = []; % no linear constraint
    beq = []; %no linear constraint
    A = []; %no linear constraint
    b  = []; %no linear constraint
    lb = []; %no lower constraint on F, a1 must be on Vine
    ub = []; %no upper constraint on F, a1 must be on Vine

    %options = optimoptions(@fmincon,'SpecifyObjectiveGradient',true,'Display','iter');
    options = optimoptions(@fmincon,'Display','iter','Algorithm','interior-point');
    contacts = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,[], options);

end