function EB_shape = EB_calcShape(x, contact, C)
%Will calculate out the corresponding y value for the x inputs given using
%EB and the contact and curvature provided

    EB_shape = zeros(length(x),1);
    
    contactLocation = contact(1);
    contactForce = contact(2);
    
    idx = find(x < contactLocation, 1, 'last');

    EB_shape(1:idx) = contactForce.*(((contactLocation/2).*(x(1:idx).^2))-((x(1:idx).^3)./6));
    EB_shape(idx+1:end) = ((contactForce*(contactLocation^2)/2).*x(idx+1:end))-(contactForce*(contactLocation^3)/6);
    EB_shape(:) = EB_shape(:) + (C/2).*(x(:).^2);
end

