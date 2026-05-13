function th_required = head_thickness(P, r, S, E)

th_required = (P * r) / ((2 * S * E) - (0.2 * P));

end