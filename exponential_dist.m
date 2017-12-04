
% Bathroom units
womens_bathrooms = 7;
mens_bathrooms = 5;
family_bathrooms = 2;

% Avg Time Spent at each bathroom (minutes)
w_time_spent = 3;
m_time_spent = 2;
f_time_spent = 5;

% avg number of patrons during each half time
num_women = 197;

% RATES ? lambda per patron type
lamda_womens_br = num_women/90;

% Arrival Times
w_arrival_first = expon(lamda_womens_br, 20);

% Arrival times on a timeline (cummulative)
cumulative_time = cumsum(w_arrival_first);

% Departure Times
w_departure_first = w_arrival_first + w_time_spent;

% does a new patron must wait for a bathroom, if so ? how much time?
% take lowest value from first_departure women
% multiply it by the number of people waiting

w_bathrooms_occupied_first = size(w_arrival_first, 2);
% min_departure_time = min(w_departure_first);
% time new arrival must wait
% w_wait_time_first = (w_first_half - w_bathrooms_occupied_first) * avg_departure_time;

    






