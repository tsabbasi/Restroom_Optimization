function result = new(num_people, bathrooms, time_spent, bathroom_units)

% Bathroom units
womens_bathrooms = 7;

% Avg Time Spent at each bathroom (minutes)
w_time_spent = 3;

% avg number of patrons during each half time
num_women = 197;

% RATES�lambda per patron type
lamda_womens_br = num_women/90;

trials = 1000;
% Arrival Times
w_arrival_times = expon(lamda_womens_br, 1000);

% Cummulative arrival times on a timeline
arrival_times = cumsum(w_arrival_times);

temp_a = arrival_times > 90;
[value, index] = find(temp_a, 1);
arrival_times = arrival_times(1:index-1);

% depart = ()
% 2 arrays: departure_times, patron_waited
% loop though arrivals
% first arrival to arrival # = bathroom number ?> add 3 to their time
% if current arrival is < previous departure time
%     current departure time = previous departure time + 3
%     patron_waited(i) = 1
% if current arrival is >= previous departure time
%     current departure = arrival time + 3 
%     patron_waited(i) = 0

% max_time = 90
% 
departure_times = zeros(1,numel(arrival_times));
patron_waited = zeros(1,numel(arrival_times));
bathroom_units = 19;
temp_depart = zeros(1, bathroom_units);
for i=1:numel(arrival_times)
    [val, idx] = min(temp_depart);
    % first visitors, bathrooms available    
    if i <= bathroom_units
        departure_times(i) = arrival_times(i) + 3;
        temp_depart(idx) = departure_times(i);
        patron_waited(i) = 0;
    % bathroom(s) occupied    
    elseif arrival_times(i) < val
        departure_times(i) = val + 3;
        temp_depart(idx) = departure_times(i);
        patron_waited(i) = 1;
    % bathroom(s) vacant
    elseif arrival_times(i) >= val
        departure_times(i) = arrival_times(i) + 3;
        temp_depart(idx) = departure_times(i);
        patron_waited(i) = 0;
    end 
end

disp(sum(patron_waited));

end
    





