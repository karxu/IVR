%This script generates feature vectors for every object in the test set, 
%and generates a vector testclasses containing the predicted
%classes of each object
%% 
Dim = 1;


%Create vectors of individual object images
im3blobs = vec3(:,:,1:16);
im5blobs = vec5(:,:,1:16);
im7blobs = vec7(:,:,1:16);
im9blobs = vec9(:,:,1:16);

im3vecs = zeros(16,Dim);
im5vecs = zeros(16,Dim);
im7vecs = zeros(16,Dim);
im9vecs = zeros(16,Dim);

%%

%Create matrix of feature vectors
for i = 1:16
    im3vecs(i,:) = getfeatures(im3blobs(:,:,i), og3);
    im5vecs(i,:) = getfeatures(im5blobs(:,:,i), og5);
    im7vecs(i,:) = getfeatures(im7blobs(:,:,i), og7);
    im9vecs(i,:) = getfeatures(im9blobs(:,:,i), og9);
end

testvecs = zeros(64, Dim);

testvecs(1:16,:) = im3vecs(1:16,:);
testvecs(17:32,:) = im5vecs(1:16,:);
testvecs(33:48,:) = im7vecs(1:16,:);
testvecs(49:64,:) = im9vecs(1:16,:);

testclasses = zeros(64);
%%

%Run classify() on each feature vector to populate testclasses
for i = 1:64
    testclasses(i) = classify(testvecs(i),11,Means,Invcors,Dim,Aprioris);
end


