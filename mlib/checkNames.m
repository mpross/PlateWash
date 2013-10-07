function out = checkNames(data, names, expectedNames)

	assert(isequal(names, expectedNames));
	assert(columns(expectedNames), columns(data)));
end
