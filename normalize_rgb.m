%Applies rgb normalization to an image by dividing value in each color
%channel by r+g+b as shown in lecture slides

function normal = normalize_rgb(i)
    normal = double(i);
    iDSum = normal(:,:,1) + normal(:,:,2) + normal(:,:,3);
    
    normal(:,:,1) = normal(:,:,1) ./ iDSum;
    normal(:,:,2) = normal(:,:,2) ./ iDSum;
    normal(:,:,3) = normal(:,:,3) ./ iDSum;
    
end