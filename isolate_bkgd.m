%takes in all given files and produces background

function bkgd_image = isolate_bkgd()
    filenames = {'02.jpg', '03.jpg', '04.jpg', '05.jpg', '06.jpg', '07.jpg', '08.jpg', '09.jpg', '10.jpg', ...
                '17.jpg', '18.jpg', '19.jpg', '20.jpg', '21.jpg'};
            
    numfiles = size(filenames, 2);    
            
    X = zeros(480, 640, 3, numfiles);
        
	for i = 1:numfiles
        im = imread(char(filenames(i)));
    	X(:,:,:,i) = im;
	end

   bkgd_image = uint8(median(X,4));
   
end


