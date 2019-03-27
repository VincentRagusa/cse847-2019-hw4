load("alzheimers/ad_data.mat");

opts.rFlag = 1;
opts.tol = 1e-6;
opts.tFlag = 4;
opts.maxIter = 5000;

for par=[0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]

    [w,c,funVal,ValueL] = LogisticR(X_train, y_train, par, opts);
    disp(w)
    disp(c)
    disp(funVal)
    
    [X,Y,~,AUC] = perfcurve(labels, scores, posclass); % how does this work? what are the parameters? how do i get the parameters out of LogisticR that need to go in here?
end