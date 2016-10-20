function convexity = convex(image)
    CH = bwconvhull(image);
    CHperim = bwperim(CH);
    imageperim = bwperim(image);
    
    convexity = sum(sum(CHperim))/sum(sum(imageperim));
end