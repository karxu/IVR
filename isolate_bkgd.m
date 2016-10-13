function bkgd_image = isolate_bkgd()
    IM1 = double(imread('02.jpg'));
    IM2 = double(imread('03.jpg'));
    IM3 = double(imread('04.jpg'));
    IM4 = double(imread('05.jpg'));
    IM5 = double(imread('06.jpg'));
    IM6 = double(imread('07.jpg'));
    %images = [IM1, IM2, IM3];
    bkgd_image = zeros(480, 640, 3);
    
    v = zeros(6);
    s = size(IM1);
    
    for r = 1:s[1]
        for c = 1:s[2]
            for rgb = 1:3
                v = [IM1(r,c,rgb),IM2(r,c,rgb),IM3(r,c,rgb), ...
                    IM4(r,c,rgb),IM5(r,c,rgb),IM6(r,c,rgb)];
                bkgd_image(r,c,rgb) = median(v);
            end
        end
    end     
end
