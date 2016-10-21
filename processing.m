% This function takes in an rgb image and returns a segmented binary image.
% The techniques used are: 
% 1. RB normalization
% 2. Background subtraction
% 3. Manual thresholding

function segmented = processing(image)

%normalize background and image
background = isolate_bkgd;
inorm = normalize_rgb(image);
bgnorm = normalize_rgb(background);

diff = abs(inorm - bgnorm);

%Manual thresholding
diffmasked = (diff > 0.014);
segmented = (diffmasked(:,:,1) | diffmasked(:,:,2) | diffmasked(:,:,3));

% Automatic thresholding using findthresh
% diffbw = 255*rgb2gray(diff);
% segmented = getbinary(diffbw);

%Adaptive thresholding
%inorm = inorm * 255;
%inorm = uint8(inorm);
%inorm = rgb2gray(inorm);
%segmentd = adapt(inorm);

segmented = bwmorph(segmented, 'clean');

figure;
imshowpair(image, segmented, 'montage');
end