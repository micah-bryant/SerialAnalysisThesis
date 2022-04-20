function contacts = find_contacta(x,A,a0, curv, L, C)
    %function will hold A (F/EI) constant in EB model and solve for contact
        %location using nonlinear contrained solver
    %inputs: sensor locations on x-axis, F/EI, initial contact location,
        %sensor measurements in curvature, current length of robot,
        %curvature from pressure mapping
    %outputs: updated contact location

    %if no curvature passed in as an argument set to 0 and signals that it
    %is in a passive state
    if nargin<7, C = 0; end

    %find which sensors have been everted in the experiment
    idx = find(x < L);
    fun = @(contact) EB_costa(contact,A, x(idx), curv(idx),C);
    x0 = a0;
    Aeq = []; % no linear constraint
    beq = []; %no linear constraint
    A = []; %no linear constraint
    b  = []; %no linear constraint
    lb = 0; %no lower constraint on F, a1 must be on Vine
    ub = L; %no upper constraint on F, a1 must be on Vine

    options = optimoptions(@fmincon,'Display','iter','Algorithm','interior-point');
    contacts = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,[], options);

end