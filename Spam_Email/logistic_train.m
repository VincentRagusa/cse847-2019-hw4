function [weights] = logistic_train(data, labels, epsilon, maxiter)
    warning('off','all') %when values get close to 0 it throws tons of warnings
    % newton-raphson: taken direcetly from the book
    size_data = size(data);
    data_points = size_data(1);
    features = size_data(2);
    
    
    w = zeros([features,1]);
    y = zeros([data_points,1]);
    R = zeros(data_points);

    iteration = 0;
    w_old = ones([features,1]);
    while (iteration < maxiter && norm(w - w_old) > epsilon)
        
        for i = 1:data_points
            y(i) = 1 / (1 + exp(-dot(w, data(i,:))) ); % w^T phi_n replaced with dot(w, phi_n)
            R(i,i) = y(i)*(1-y(i));
        end
        
        H = data.' * R * data;
        z = (data * w) - (R \ (y - labels)); % inv(A)*b == A\b
        %disp([y labels])
        
        w_old = w;
        w = H \ (data.' * (R * z)); % inv(A)*b == A\b
        
        iteration = iteration + 1;
    end
    weights = w;
end

