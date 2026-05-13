function V = internal_volume(r, L)

h = r / 2;

V_cyl = pi * r^2 * L;

V_heads = (4/3) * pi * r^2 * h;

V = V_cyl + V_heads;

end