%Script for processing images and feeding buildmodel.m

% vecs = list of feature vectors where vecs[i] is a feature vector

% classes = list of true class values 
Dim = 1;

im2blobs = vec2(:,:,1:16);
im4blobs = vec4(:,:,1:16);
im6blobs = vec6(:,:,1:16);
im8blobs = vec8(:,:,1:16);
im10blobs = vec10(:,:,1:16);

im2vecs = zeros(16,Dim);
im4vecs = zeros(16,Dim);
im6vecs = zeros(16,Dim);
im8vecs = zeros(16,Dim);
im10vecs = zeros(16,Dim);

im3blobs = vec3(:,:,1:16);
im9blobs = vec9(:,:,1:16);
im7blobs = vec7(:,:,1:16);

im3vecs = zeros(16, Dim);
im9vecs = zeros(16,Dim);
im7vecs = zeros(16,Dim);

for i = 1:16
    im2vecs(i,:) = getfeatures(im2blobs(:,:,i), og2);
    im4vecs(i,:) = getfeatures(im4blobs(:,:,i), og4);
    im6vecs(i,:) = getfeatures(im6blobs(:,:,i), og6);
    im8vecs(i,:) = getfeatures(im8blobs(:,:,i), og8);
    im10vecs(i,:) = getfeatures(im10blobs(:,:,i), og10);
    
    im3vecs(i,:) = getfeatures(im3blobs(:,:,i), og3);
    im9vecs(i,:) = getfeatures(im9blobs(:,:,i), og9);
    im7vecs(i,:) = getfeatures(im7blobs(:,:,i), og7);
end

vecs = zeros(80, Dim);

vecs(1:16,:) = im2vecs(1:16,:);
vecs(17:32,:) = im4vecs(1:16,:);
vecs(33:48,:) = im6vecs(1:16,:);
vecs(49:64,:) = im8vecs(1:16,:);
vecs(65:80,:) = im10vecs(1:16,:);

vecs(81:96,:) = im3vecs(1:16,:);
vecs(97:112,:) = im9vecs(1:16,:);
vecs(113:128,:) = im7vecs(1:16,:);


classes2 = [1, 1, 8, 2, 9, 9, 9, 10, 10, 6, 7, 4, 11, 11, 11, 11]; 
classes4= [3, 5, 8, 2, 2, 9, 10, 10, 6, 6, 4, 4, 11, 6, 11, 11];
classes6 = [1, 1, 3, 8, 8, 9, 2, 2, 10, 6, 6, 4, 11, 11, 11, 4];
classes8 = [1, 3, 5, 2, 8, 3, 9, 9, 9, 6, 10, 6, 7, 7, 4, 11];
classes10 = [1, 5, 3, 8, 3, 2, 8, 2, 9, 3, 9, 10, 4, 9, 11, 11];

classes3 = [1	1	5	8	3	8	2	2	9	9	8	8	9	6	10	7];
classes9 = [5 8 3 2 8 9 9 9 6 10 7 4 6 11 11 11];
classes7 = [1	5	3	2	8	9	9	9	9	11	6	7	7	4	11	11];

classes(1:16) = classes2;
classes(17:32) = classes4;
classes(33:48) = classes6;
classes(49:64) = classes8;
classes(65:80) = classes10;
classes(81:96) = classes3;
classes(97:112) = classes9;
classes(113:128) = classes7;

N = 128;

[Means,Invcors,Aprioris] = buildmodel(Dim, vecs, N, 11, classes);

%1 = battery
%2 = bracket
%3 = 2 pound
%4 = 1 pound
%5 = 50p
%6 = 20p
%7 = 10p
%8 = washer with small hole
%9 = washer with large hole
%10 = nut
%11 = noise


%buildmodel(Dim,vecs,N,Numclass,Classes)

% Numclass is number of classes, 10 objects 
% N is num of rows in Vecs, number of total blobs from even images (~60)
% Dim is number of features, num of col in Vecs (8 features)
% vec: matrix of vectors, training data, each col will be a feature vector,
% 2D struct (~60 * 8)
% Classes: list struct (~60)