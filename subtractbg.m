function subtracted = subtractbg(image, bg)

bg = (bg);
image = (image);

r = abs(bg(:,:,1)-image(:,:,1));
g = abs(bg(:,:,2)-image(:,:,2));
b = abs(bg(:,:,3)-image(:,:,3));

%This uses binary thresholding algorithm from lectures
%r = getbinary(r);
%g = getbinary(g);
%b = getbinary(b);

%This is hacky af
r = (r > 10);
g = (g > 10);
b = (b > 10);


subtracted = r | g | b;

end
