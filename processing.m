function segmented = processing(image)

background = isolate_bkgd;
inorm = normalize_rgb(image);
bgnorm = normalize_rgb(background);
figure;

diff = abs(inorm - bgnorm);

%Manual thresholding
diffmasked = (diff > .02);
segmented = (diffmasked(:,:,1) | diffmasked(:,:,2) | diffmasked(:,:,3));

%Automatic thresholding using findthresh
%diffbw = 255*rgb2gray(diff);
%segmented = getbinary(diffbw);

%Adaptive thresholding
%inorm = inorm * 255;
%inorm = uint8(inorm);
%inorm = rgb2gray(inorm);
%segmentd = adapt(inorm);

imshowpair(segmented, image, 'montage');
end