% Avg number of patrons during each half time
num_women = 197;
num_men = 210;
num_families = 106;

% Avg Time Spent at each bathroom (minutes)
w_time_spent = 3;
m_time_spent = 2;
f_time_spent = 5;

% Initital bathroom units
womens_bathrooms = 7;
mens_bathrooms = 5;
family_bathrooms = 2;

% INITIAL PATRONS WAITING (with original BR units)
women = count_patrons_waiting(num_women, w_time_spent, womens_bathrooms);
men = count_patrons_waiting(num_men, m_time_spent, mens_bathrooms);
families = count_patrons_waiting(num_families, f_time_spent, family_bathrooms);
disp('INITIAL RESULTS')
fprintf("%d Womens Bathroom Units, %d patrons waited\n\n", womens_bathrooms, women);
fprintf("%d Mens Bathroom Units, %d patrons waited\n\n", mens_bathrooms, men);
fprintf("%d Family Bathroom Units, %d patrons waited\n\n", family_bathrooms, families);

final_results = zeros(1,3);
for i=1:3
    if i==1
        final_results(i) = count_bathroom_units(num_women, w_time_spent, womens_bathrooms);
    elseif i == 2
        final_results(i) = count_bathroom_units(num_men, m_time_spent, mens_bathrooms);
    else 
        final_results(i) = count_bathroom_units(num_families, f_time_spent, family_bathrooms);
    end
end

disp('FINAL RESULTS - zero patrons waiting')
fprintf("Optimal Womens Bathroom Units: \n%d\n\n", final_results(1));
fprintf("Optimal Mens Bathroom Units: \n%d\n\n", final_results(2));
fprintf("Optimal Family Bathroom Units: \n%d\n\n", final_results(3));
