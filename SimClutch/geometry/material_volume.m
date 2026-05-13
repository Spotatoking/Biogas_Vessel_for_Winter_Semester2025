function Vmat = material_volume(r, L, ts, th)

r_outer_shell = r + ts;

h_inner = r / 2;
h_outer = r_outer_shell / 2;

V_inner = ...
    pi * r^2 * L + ...
    (4/3) * pi * r^2 * h_inner;

V_outer = ...
    pi * r_outer_shell^2 * L + ...
    (4/3) * pi * r_outer_shell^2 * h_outer;

Vmat = V_outer - V_inner;

end