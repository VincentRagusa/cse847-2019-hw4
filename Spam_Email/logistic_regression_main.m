features = importdata("spam_email/data.txt");
truths = importdata("spam_email/labels.txt");

X_train = features(1:2000, :);
Y_train = truths(1:2000, :);

X_test = features(2001:end, :);
Y_test = truths(2001:end, :);

test_results = []
test_cases = [200, 500, 800, 1000, 1500, 2000];
for tc = test_cases
    %disp(tc)
    w_star = logistic_train(X_train(1:tc, :), Y_train(1:tc, :), 1e-15, 2);

    test_size = size(Y_test);
    data_points = test_size(1);

    accuracy = 0;
    for i = 1:data_points
        y = round(1 / (1 + exp(-dot(w_star, X_test(i,:))) ));
        if y == Y_test(i)
            accuracy = accuracy + 1;
        end
    end
    test_results = [test_results 100*(accuracy/data_points)]
    %disp([tc 100*(accuracy/data_points)])
end

figure
plot(test_cases,test_results,'-s')
grid on