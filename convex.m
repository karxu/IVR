% Given a BW image containing a single object, this function returns the
% convexity of the object as per the lecture slides

function convexity = convex(image)
    CH = bwconvhull(image);
    CHperim = bwperim(CH);
    imageperim = bwperim(image);
    
    convexity = sum(sum(CHperim))/sum(sum(imageperim));
end