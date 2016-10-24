%Script for processing images and feeding buildmodel.m

Dim = 1;

im5blobs = vec5(:,:,1:16);

im5vecs = zeros(16,Dim);

for i = 1:16
    im5vecs(i,:) = getfeatures(im5blobs(:,:,i), og5);
end

testvecs = zeros(16, Dim);

testvecs(1:16,:) = im5vecs(1:16,:);

classes = zeros(16);

for i = 1:16
    classes(i) = classify(testvecs(i),11,Means,Invcors,Dim,Aprioris);
end

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