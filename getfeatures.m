%This function takes in a binary image of an object and the original rgb
%image to return a vector of features.

function featurevec = getfeatures(blob, original)

%size = sum(sum(blob));
%colorvec = colormask(original, blob);
%convexity = convex(blob);
moments = getproperties(blob);

%featurevec(1) = size;
%featurevec(1) = convexity;
%featurevec(3:5) = moments;
%featurevec(2:4) = colorvec;
featurevec = moments(1);

end