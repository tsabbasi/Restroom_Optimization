
numTrials = 10;
lambda = [.5, 1.0, 5.0];

XMIN = 0;
XMAX = 5;
YMIN = 0.0;
YMAX= 1.6;

clf;
figure(1);
x = 0:.1:10;

% exppdf function comes from same toolbox as exprnd
probability_mass_function1 = exppdf(x, 1/.5);
plot(x, probability_mass_function1, '+r');
hold on;
probability_mass_function2 = exppdf(x, 1/1.0);
plot(x, probability_mass_function2, '+b');
hold on;
probability_mass_function3 = exppdf(x, 1/1.5);
plot(x, probability_mass_function3, '+g');
hold on;

axis([XMIN XMAX YMIN YMAX]);