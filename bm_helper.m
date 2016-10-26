%Script for processing images and feeding buildmodel.m

% Need more instances per class than number of features being used
% Rotate objects by 90 degrees to get more training images

Dim = 1;

im2blobs = vec2(:,:,1:16);
im4blobs = vec4(:,:,1:16);
im6blobs = vec6(:,:,1:16);
im8blobs = vec8(:,:,1:16);
im10blobs = vec10(:,:,1:16);

im2blobs90 = zeros(640, 480, 16);
im4blobs90 =zeros(640, 480, 16);
im6blobs90 = zeros(640, 480, 16);
im8blobs90 = zeros(640, 480, 16);
im10blobs90 = zeros(640, 480, 16);

im2blobs180 = zeros(480, 640, 16);
im4blobs180 =zeros(480, 640, 16);
im6blobs180 = zeros(480, 640, 16);
im8blobs180 = zeros(480, 640, 16);
im10blobs180 = zeros(480, 640, 16);

im2blobs270 = zeros(640, 480, 16);
im4blobs270 =zeros(640, 480, 16);
im6blobs270 = zeros(640, 480, 16);
im8blobs270 = zeros(640, 480, 16);
im10blobs270 = zeros(640, 480, 16);

for i = 1:16
    im2blobs90(:,:,i) = imrotate(im2blobs(:,:,i), 90);
    im4blobs90(:,:,i) = imrotate(im4blobs(:,:,i), 90);
    im6blobs90(:,:,i) = imrotate(im6blobs(:,:,i), 90);
    im8blobs90(:,:,i) = imrotate(im8blobs(:,:,i), 90);
    im10blobs90(:,:,i) = imrotate(im10blobs(:,:,i), 90);
    
    im2blobs180(:,:,i) = imrotate(im2blobs(:,:,i), 180);
    im4blobs180(:,:,i) = imrotate(im4blobs(:,:,i), 180);
    im6blobs180(:,:,i) = imrotate(im6blobs(:,:,i), 180);
    im8blobs180(:,:,i) = imrotate(im8blobs(:,:,i), 180);
    im10blobs180(:,:,i) = imrotate(im10blobs(:,:,i), 180);
    
    im2blobs270(:,:,i) = imrotate(im2blobs(:,:,i), -90);
    im4blobs270(:,:,i) = imrotate(im4blobs(:,:,i), -90);
    im6blobs270(:,:,i) = imrotate(im6blobs(:,:,i), -90);
    im8blobs270(:,:,i) = imrotate(im8blobs(:,:,i), -90);
    im10blobs270(:,:,i) = imrotate(im10blobs(:,:,i),-90);
end

im2vecs = zeros(16,Dim);
im4vecs = zeros(16,Dim);
im6vecs = zeros(16,Dim);
im8vecs = zeros(16,Dim);
im10vecs = zeros(16,Dim);

im2vecs90 = zeros(16,Dim);
im4vecs90 = zeros(16,Dim);
im6vecs90 = zeros(16,Dim);
im8vecs90 = zeros(16,Dim);
im10vecs90 = zeros(16,Dim);

im2vecs180 = zeros(16,Dim);
im4vecs180 = zeros(16,Dim);
im6vecs180 = zeros(16,Dim);
im8vecs180 = zeros(16,Dim);
im10vecs180 = zeros(16,Dim);

im2vecs270 = zeros(16,Dim);
im4vecs270 = zeros(16,Dim);
im6vecs270 = zeros(16,Dim);
im8vecs270 = zeros(16,Dim);
im10vecs270 = zeros(16,Dim);

for i = 1:16
    im2vecs(i,:) = getfeatures(im2blobs(:,:,i), og2);
    im4vecs(i,:) = getfeatures(im4blobs(:,:,i), og4);
    im6vecs(i,:) = getfeatures(im6blobs(:,:,i), og6);
    im8vecs(i,:) = getfeatures(im8blobs(:,:,i), og8);
    im10vecs(i,:) = getfeatures(im10blobs(:,:,i), og10);
    
    im2vecs90(i,:) = getfeatures(im2blobs90(:,:,i), imrotate(og2,90));
    im4vecs90(i,:) = getfeatures(im4blobs90(:,:,i), imrotate(og4,90));
    im6vecs90(i,:) = getfeatures(im6blobs90(:,:,i), imrotate(og6,90));
    im8vecs90(i,:) = getfeatures(im8blobs90(:,:,i), imrotate(og8,90));
    im10vecs90(i,:) = getfeatures(im10blobs90(:,:,i), imrotate(og10,90));
    
    im2vecs180(i,:) = getfeatures(im2blobs180(:,:,i), imrotate(og2,180));
    im4vecs180(i,:) = getfeatures(im4blobs180(:,:,i), imrotate(og4,180));
    im6vecs180(i,:) = getfeatures(im6blobs180(:,:,i), imrotate(og6,180));
    im8vecs180(i,:) = getfeatures(im8blobs180(:,:,i), imrotate(og8,180));
    im10vecs180(i,:) = getfeatures(im10blobs180(:,:,i), imrotate(og10,180));
    
    im2vecs270(i,:) = getfeatures(im2blobs270(:,:,i), imrotate(og2,270));
    im4vecs270(i,:) = getfeatures(im4blobs270(:,:,i), imrotate(og4,270));
    im6vecs270(i,:) = getfeatures(im6blobs270(:,:,i), imrotate(og6,270));
    im8vecs270(i,:) = getfeatures(im8blobs270(:,:,i), imrotate(og8,270));
    im10vecs270(i,:) = getfeatures(im10blobs270(:,:,i), imrotate(og10,270));
end

vecs = zeros(320, Dim);

vecs(1:16,:) = im2vecs(1:16,:);
vecs(17:32,:) = im4vecs(1:16,:);
vecs(33:48,:) = im6vecs(1:16,:);
vecs(49:64,:) = im8vecs(1:16,:);
vecs(65:80,:) = im10vecs(1:16,:);

vecs(81:96,:) = im2vecs90(1:16,:);
vecs(97:112,:) = im4vecs90(1:16,:);
vecs(113:128,:) = im6vecs90(1:16,:);
vecs(129:144,:) = im8vecs90(1:16,:);
vecs(145:160,:) = im10vecs90(1:16,:);

vecs(161:176,:) = im2vecs180(1:16,:);
vecs(177:192,:) = im4vecs180(1:16,:);
vecs(193:208,:) = im6vecs180(1:16,:);
vecs(209:224,:) = im8vecs180(1:16,:);
vecs(225:240,:) = im10vecs180(1:16,:);

vecs(241:256,:) = im2vecs270(1:16,:);
vecs(257:272,:) = im4vecs270(1:16,:);
vecs(273:288,:) = im6vecs270(1:16,:);
vecs(289:304,:) = im8vecs270(1:16,:);
vecs(305:320,:) = im10vecs270(1:16,:);

classes2 = [1, 1, 8, 2, 9, 9, 9, 10, 10, 6, 7, 4, 11, 11, 11, 11]; 
classes4= [3, 5, 8, 2, 2, 9, 10, 10, 6, 6, 4, 4, 11, 6, 11, 11];
classes6 = [1, 1, 3, 8, 8, 9, 2, 2, 10, 6, 6, 4, 11, 11, 11, 4];
classes8 = [1, 3, 5, 2, 8, 3, 9, 9, 9, 6, 10, 6, 7, 7, 4, 11];
classes10 = [1, 5, 3, 8, 3, 2, 8, 2, 9, 3, 9, 10, 4, 9, 11, 11];

classes = zeros(1,320);

classes(1:16) = classes2;
classes(17:32) = classes4;
classes(33:48) = classes6;
classes(49:64) = classes8;
classes(65:80) = classes10;

classes(81:160) = classes(1:80);
classes(161:320) = classes(1:160);

Numclass = 11;
N = 320;

[Means,Invcors,Aprioris] = buildmodel(Dim, vecs, N, Numclass, classes);

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