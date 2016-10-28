% This function takes in an rgb image and returns a segmented binary image.
% The techniques used are: 
% 1. RB normalization
% 2. Background subtraction
% 3. Manual thresholding

function segmented = processing(image, background)

%normalize background and image
inorm = normalize_rgb(image);
bgnorm = normalize_rgb(background);

imshowpair(image, inorm, 'montage');
figure;
imshowpair(background, bgnorm, 'montage');

%Subtract background
diff = abs(inorm - bgnorm);

%Manual thresholding of background subtracted image
diffmasked = (diff > .014);
segmented = (diffmasked(:,:,1) | diffmasked(:,:,2) | diffmasked(:,:,3));

%Cleaning to eliminate some noise
segmented = bwmorph(segmented, 'clean');
imshowpair(image, segmented, 'montage');

end