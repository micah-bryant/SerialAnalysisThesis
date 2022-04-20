function residuals = EB_costa(contact,A, x, curv, C)
    %preallocate EB model calculation
    EB_curv = EB_calc(x,[contact,A],C);
    
    %return residuals
    residuals = norm(EB_curv-curv,1);
end