load("alzheimers/ad_data.mat");

opts.rFlag = 1;
opts.tol = 1e-6;
opts.tFlag = 4;
opts.maxIter = 5000;

for par=[0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]

    [w,c,funVal,ValueL] = LogisticR(X_train, y_train, par, opts);
    
    %[X,Y,~,AUC] = perfcurve(labels, scores, posclass); % how does this work? what are the parameters? how do i get the parameters out of LogisticR that need to go in here?
    
    features = 0;
    size_w = size(w);
    num_features = size_w(1);
    for m = 1:num_features
        if (w(m) > 0) || (w(m) < 0)
            features = features + 1;
        end
    end
    disp([par, features])
end