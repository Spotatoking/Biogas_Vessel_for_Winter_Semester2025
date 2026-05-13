function f = objective_function(x, material, params)

r  = x(1);
L  = x(2);
ts = x(3);
th = x(4);
P_bar = x(5);

Vmat = material_volume(r, L, ts);

M = mass_calc(Vmat, material.rho);

V = internal_volume(r, L);

E = energy_storage(V, P_bar);

M_ref = 100;

E_target = 200;

w_mass = 10.0;
w_energy = 1.0;

f = ...
    w_mass * (M / M_ref) + ...
    w_energy * ((E - E_target))^2;

end