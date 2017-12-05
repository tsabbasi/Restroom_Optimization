function result = count_bathroom_units(num_people, time_spent, bathroom_units)
patron_waited = 1;
while patron_waited > 0
        patron_waited = count_patrons_waiting(num_people, time_spent, bathroom_units);
        if patron_waited > 0 && patron_waited < 5 
            bathroom_units = bathroom_units + 1;
        elseif patron_waited > 100 
            bathroom_units = bathroom_units + 10;
        end
end
result = bathroom_units;
end
