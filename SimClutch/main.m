clear;
clc;

addpath('geometry');
addpath('physics');
addpath('asme');
addpath('optimization');
addpath('utils');

materials = load_materials('data/materials.csv');

params.E_min = 160;
params.E_max = 100000;

params.weld_efficiency = 1.0;

results = [];

for i = 1:height(materials)

    material.name = materials.matname{i};
    material.type = materials.mattype{i};

    material.S = materials.stressat40(i) * 1e6;
    material.rho = materials.density(i);

    fprintf('\nOptimizing: %s\n', material.name);

    result = run_optimization(material, params);

    results = [results; result];

end

disp(results);

if ~exist('output', 'dir')
    mkdir('output');
end

writetable(results,'output/optimization_results.csv');
best_design = select_best_design(results);

writetable(...
    best_design,...
    'output/best_design.csv');
fprintf('\nOptimization complete.\n');