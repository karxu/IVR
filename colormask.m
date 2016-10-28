%Given an rgb image and a binary image containing 1 connected component, this function returns
%the number of red, blue, and green pixels in the object

function colorvec = colormask(image, mask)

    image = double(image);
    mask = double(mask);
    r = image(:,:,1) .* mask;
    g = image(:,:,2) .* mask;
    b = image(:,:,3) .* mask;
 
    colorvec = [sum(sum(r)),sum(sum(g)),sum(sum(b))];
end