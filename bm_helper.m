%Script for processing images and feeding buildmodel.m

% v = vector of training images (rgb)
v = zeros(480, 640, 3, 5);

v(:,:,:,1) = imread('02.jpg');
v(:,:,:,2) = imread('04.jpg');
v(:,:,:,3) = imread('06.jpg');
v(:,:,:,4) = imread('08.jpg');
v(:,:,:,5) = imread('10.jpg');

% w = vector of processed training images (bw)
% w = zeros(480, 640, 5);
% 
% for i = 1:5
%     w[i] = processing(v(:,:,:,i));
% 
% end
    
% for each bw image in w, we create a list of blobs x
    % for each blob in x, we calculate a feature vector and append that
    % feature vector to vecs

% vecs = list of feature vectors where vecs[i] is a feature vector

% classes = list of true class values 


% Numclass is number of classes, 10 objects 
% N is num of rows in Vecs, number of total blobs from even images (~60)
% Dim is number of features, num of col in Vecs (8 features)
% vec: matrix of vectors, training data, each col will be a feature vector,
% 2D struct (~60 * 8)
% Classes: list struct (~60)