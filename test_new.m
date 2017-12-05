% Initital bathroom units
womens_bathrooms = 7;
mens_bathrooms = 5;
family_bathrooms = 2;

% Avg Time Spent at each bathroom (minutes)
w_time_spent = 3;
m_time_spent = 2;
f_time_spent = 5;

% Avg number of patrons during each half time
num_women = 197;
num_men = 210;
num_families = 106;
w_patron_waited = 1;
bathrooms = womens_bathrooms;
while w_patron_waited > 0
    w_patron_waited = new(num_women, w_time_spent, bathrooms);
    if w_patron_waited > 0 
        bathrooms = bathrooms + 1;
    end
        
end
