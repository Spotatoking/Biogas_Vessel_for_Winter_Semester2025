function [c, ceq] = constraint_function(x, material, params)

r  = x(1);
L  = x(2);
ts = x(3);
th = x(4);
P_bar = x(5);

P = P_bar * 1e5;

V = internal_volume(r, L);

V_min = 0.025;
V_max = 0.035;

E_stored = energy_storage(V, P_bar);

ts_required = shell_thickness(...
    P,...
    r,...
    material.S,...
    params.weld_efficiency);

th_required = head_thickness(...
    P,...
    r,...
    material.S,...
    params.weld_efficiency);

L_over_D = L / (2*r);

c = [
    ts_required - ts;
    th_required - th;
    E_stored - params.E_max;
    1 - L_over_D;
    L_over_D - 6
    V_min - V;
    V - V_max
];

ceq = [];

end