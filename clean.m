%not in use right now
%goal: clean the noise from background of binary image

function cleaned = clean(image)
    se = strel('disk',0);
    eroded = imopen(image,se);
    imshow(eroded);
    
end