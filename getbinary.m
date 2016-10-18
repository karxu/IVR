function binary_pic = getbinary(im)

filter = gausswin(50,6);
filter = filter/sum(filter);

first_hist = dohist(im,1);
smooth_hist = conv(filter,first_hist);

thresh = findthresh(smooth_hist, 4, 0);

binary_pic = double(im);
binary_pic = (binary_pic > thresh);

end