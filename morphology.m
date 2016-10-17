function morph = morphology(binarypic)
se = strel('disk', 1);
morph = imopen(binarypic, se);
end
