function ts_required = shell_thickness(P, r, S, E)

ts_required = (P * r) / ((S * E) - (0.6 * P));

end