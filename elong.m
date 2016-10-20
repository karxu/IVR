function elongation = elong(image)
    axes = regionprops(image, 'MajorAxisLength', 'MinorAxisLength');
    elongation = 
    
end