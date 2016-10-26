% This function takes in an rgb image and returns a segmented binary image.
% The techniques used are: 
% 1. RB normalization
% 2. Background subtraction
% 3. Manual thresholding

function segmented = processing(image, background)

%normalize background and image
inorm = image; %normalize_rgb(image);
bgnorm = background; %normalize_rgb(background);

diff = abs(inorm - bgnorm);

%Manual thresholding
diffmasked = (diff > 1.5);
segmented = (diffmasked(:,:,1) | diffmasked(:,:,2) | diffmasked(:,:,3));

segmented = bwmorph(segmented, 'clean');

figure;
end