
numTrials = 5;
lambda = [.5, 1.0, 1.5];

XMIN = 0;
XMAX = numTrials;
YMIN = 0;
YMAX= 1.6;

clf;
figure(1);
for index=1:numel(lambda)
    for i=1:1:numTrials
        probability_mass_function = sample_exp_dist(lambda(index), 1);
        
        switch(index)
            case 1
                plot(i, probability_mass_function, '+r');
                hold on;

            case 2
                plot(i, probability_mass_function, '+b');
                hold on;

            case 3
                plot(i, probability_mass_function, '+g');
                hold on;

        end
        grid on;

    end
end
axis([XMIN XMAX YMIN YMAX]);