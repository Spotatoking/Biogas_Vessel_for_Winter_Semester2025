function materials = load_materials(filename)

materials = readtable(filename);

requiredColumns = {...
    'matname',...
    'mattype',...
    'stressat40',...
    'density'};

for i = 1:length(requiredColumns)

    if ~ismember(requiredColumns{i}, materials.Properties.VariableNames)

        error(['Missing column: ', requiredColumns{i}]);

    end

end

invalidRows = ...
    ismissing(materials.matname) | ...
    isnan(materials.stressat40) | ...
    isnan(materials.density);

materials(invalidRows,:) = [];

materials.matname = cellstr(materials.matname);
materials.mattype = cellstr(materials.mattype);

fprintf('\nLoaded %d materials.\n', height(materials));

end