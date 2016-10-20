%helper function for showing blobs that were detected
function im_vec = show(binary,vector)
figure;
imshow(binary);
for i = 1:20
    figure;
    imshow(vector(:,:,i));
end
end
