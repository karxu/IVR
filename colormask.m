function colorvec = colormask(image, mask)

    image = double(image);
    mask = double(mask);
    r = image(:,:,1) .* mask;
    g = image(:,:,2) .* mask;
    b = image(:,:,3) .* mask;
 
    colorvec = [sum(sum(r)),sum(sum(g)),sum(sum(b))];
%      masked = zeros(480, 640, 3);
%      masked(:,:,1) = r;
%      masked(:,:,2) = g;
%      masked(:,:,3) = b;
%      masked = uint8(masked);
%      figure;
%      imshow(masked);
end