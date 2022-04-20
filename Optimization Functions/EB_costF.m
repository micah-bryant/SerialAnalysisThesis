function residuals = EB_costF(contact,a, x, curv,C)

    %preallocate EB model calculation
    EB_curv = EB_calc(x,[a,contact],C);
   
    %return residuals
    residuals = norm(EB_curv-curv,1);
end