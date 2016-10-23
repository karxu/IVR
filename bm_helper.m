%Script for processing images and feeding buildmodel.m

% vecs = list of feature vectors where vecs[i] is a feature vector

% classes = list of true class values 

im2blobs = vec2(:,:,1:16);
im4blobs = vec4(:,:,1:16);
im6blobs = vec6(:,:,1:16);
im8blobs = vec8(:,:,1:16);
im10blobs = vec10(:,:,1:16);

im2vecs = zeros(16,8);
im4vecs = zeros(16,8);
im6vecs = zeros(16,8);
im8vecs = zeros(16,8);
im10vecs = zeros(16,8);

for i = 1:16
    im2vecs(i,:) = getfeatures(im2blobs(:,:,i), og2);
    im4vecs(i,:) = getfeatures(im4blobs(:,:,i), og4);
    im6vecs(i,:) = getfeatures(im6blobs(:,:,i), og6);
    im8vecs(i,:) = getfeatures(im8blobs(:,:,i), og8);
    im10vecs(i,:) = getfeatures(im10blobs(:,:,i), og10);
end

vecs = zeros(80, 8);

vecs(1:16,:) = im2vecs(1:16,:);
vecs(17:32,:) = im4vecs(1:16,:);
vecs(33:48,:) = im6vecs(1:16,:);
vecs(49:64,:) = im8vecs(1:16,:);
vecs(65:80,:) = im10vecs(1:16,:);

Dim = 8;
Numclass = 10;

%buildmodel(Dim,vecs,N,Numclass,Classes)

% Numclass is number of classes, 10 objects 
% N is num of rows in Vecs, number of total blobs from even images (~60)
% Dim is number of features, num of col in Vecs (8 features)
% vec: matrix of vectors, training data, each col will be a feature vector,
% 2D struct (~60 * 8)
% Classes: list struct (~60)