function binary_pic = getbinary(im)

filter = gausswin(50,6);
filter = filter/sum(filter);

first_hist = dohist(im,1);
smooth_hist = conv(filter,first_hist);

thresh = findthresh(smooth_hist, 4, 0);

binary_pic = double(im);
binary_pic = (binary_pic > thresh);

binary_pic = uint8(binary_pic);
end

%How to get rid of shadows: normalized_rgb results in really sparse
%images. Are we doing it wrong??

%How to get rid of image fragment in background image - can we get more BG
%images from Maurice pls?

%Are we doing background subtraction wrong?
