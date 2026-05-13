function best_design = select_best_design(results)

[~, idx] = min(results.Mass);

best_design = results(idx,:);

end