function EB_curv = EB_calc(x, contact, C)
%Will calculate out the curvature at each of the x coordinates given when
%provided details of the contact

    EB_curv = zeros(length(x),1);
    
    contactLocation = contact(1);
    contactForce = contact(2);
    
    idx = find(x < contactLocation);
    
    EB_curv(idx) = contactForce.*(contactLocation-x(idx));
    EB_curv(:) = EB_curv(:) + C;
end

