% main blob detection function
function im_vector = blob(image)

im_vector = zeros(480, 640, 1);
x = 1;
   b = getlargest(image,0); %get largest object

   while sum(sum(b)) > 0 
       im_vector(:,:,x) = b;
       image = image - b; %subtract largest object from image
       b = getlargest(image,0); % get next largest object
       x = x+1; %repeat until there are no objects
   end    
   
   
end

%Given blob image a and original image I, 
%Dot-multiply a with I in every color channel
%calculate sum(sum)) for red, blue, and green color channels of a*I
%Divide each of those by size(a) --> Should equal MEAN color of the object
%in each color channel