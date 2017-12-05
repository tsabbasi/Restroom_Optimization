function result = new(num_people, time_spent, bathroom_units)

% Bathroom units
womens_bathrooms = 7;

% Avg Time Spent at each bathroom (minutes)
w_time_spent = 3;

% avg number of patrons during each half time
num_women = 197;

total_time = 90;
trials = 1000;

% RATES lambda per patron type
lamda = num_people/total_time;

% Arrival Times
arrival_times = expon(lamda, trials);

% Cummulative arrival times on a timeline
arrival_times = cumsum(arrival_times);

% Truncating arrivals after 90 minutes
post_game_arrivals = arrival_times > 90;
[~, index] = find(post_game_arrivals, 1);
arrival_times = arrival_times(1:index-1);


departure_times = zeros(1, numel(arrival_times));
patron_waited = zeros(1, numel(arrival_times));
br_wait_times = zeros(1, bathroom_units);

for i=1:numel(arrival_times)
    [val, idx] = min(br_wait_times);
    % first visitors, bathrooms available, no wait    
    if i <= bathroom_units
        departure_times(i) = arrival_times(i) + time_spent;
        br_wait_times(idx) = departure_times(i);
    % bathroom(s) occupied, patron waits    
    elseif arrival_times(i) < val
        departure_times(i) = val + time_spent;
        br_wait_times(idx) = departure_times(i);
        patron_waited(i) = 1;
    % bathroom(s) vacant, no wait
    elseif arrival_times(i) >= val
        departure_times(i) = arrival_times(i) + time_spent;
        br_wait_times(idx) = departure_times(i);
    end 
end

% total number of patrons that had to wait
result = sum(patron_waited);

end
    






