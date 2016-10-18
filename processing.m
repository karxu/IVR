function segmented = processing(image)

background = isolate_bkgd;
inorm = normalize_rgb(image);
bgnorm = normalize_rgb(background);

diff = abs(inorm - bgnorm);
%diffmasked = (diff > .04);
%segmented = (diffmasked(:,:,1) | diffmasked(:,:,2) | diffmasked(:,:,3));

diffbw = 255*rgb2gray(diff);
segmented = getbinary(diffbw);

figure;
imshowpair(segmented, image, 'montage');
end

%PENDING CHOICES: 
%To use manual mask or calculated mask for thresholding diff
    %Can try findthresh.m and adapt.m as options for thresholding
 