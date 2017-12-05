function result = sample_exp_dist(lambda, trials)

% mu is 1/lambda
result = exprnd(1/lambda, 1, trials);

end