%Given an rgb image, a binary image, and a vector showing individual
%objects in the image, this function displays all of the objects

function im_vec = show(og,binary,vector)

for i = 1:20
    figure;
    imshow(vector(:,:,i));
end
figure;
im_vec = zeros(1,1);
imshowpair(og,binary,'montage');
end
