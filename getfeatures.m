function featurevec = getfeatures(blob, original)

featurevec = zeros(1,8);

size = sum(sum(blob));
colorvec = colormask(original, blob);
convexity = convex(blob);
moments = getproperties(blob);

featurevec(1) = size;
featurevec(2) = convexity;
featurevec(3:5) = moments;
featurevec(6:8) = colorvec;

end
