function result = count_patrons_waiting(num_people, time_spent, bathroom_units)

total_time = 90;
trials = 500;

% RATE ? events over period of time
lamda = num_people/total_time;

% ARRIVAL TIMES
arrival_times = sample_exp_dist(lamda, trials);
% Cummulative arrival times on a timeline
arrival_times = cumsum(arrival_times);
% Truncating arrivals after 90 minutes
post_game_arrivals = arrival_times > 90;
[~, index] = find(post_game_arrivals, 1);
arrival_times = arrival_times(1:index-1);

% DEPARTURE TIMES IMPLEMENTATION
departure_times = zeros(1, numel(arrival_times));
patrons_waited = zeros(1, numel(arrival_times));
%  available bathroom units w/ their wait times updated per arrival
%  wait time is essentially equal to departure time of person using BR
br_wait_times = zeros(1, bathroom_units);

for i=1:numel(arrival_times)
    % new arrival will go to the first available BR ?> min(br_wait_time)     
    [val, idx] = min(br_wait_times);
    % first visitors, bathrooms available, no wait    
    if i <= bathroom_units
        departure_times(i) = arrival_times(i) + time_spent;
        br_wait_times(idx) = departure_times(i);
    % bathroom(s) occupied, patron waits    
    elseif arrival_times(i) < val
        departure_times(i) = val + time_spent;
        br_wait_times(idx) = departure_times(i);
        patrons_waited(i) = 1;
    % bathroom(s) vacant, no wait
    elseif arrival_times(i) >= val
        departure_times(i) = arrival_times(i) + time_spent;
        br_wait_times(idx) = departure_times(i);
    end 
end

% total number of patrons that had to wait
result = sum(patrons_waited);

end
    