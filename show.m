%helper function for showing blobs that were detected
function im_vec = show(og,binary,vector)

for i = 1:20
    figure;
    imshow(vector(:,:,i));
end
figure;
imshowpair(og,binary,'montage');
end
