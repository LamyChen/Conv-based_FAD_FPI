%% draw3Dmap  function
function [] = draw_prettymap3D(savepath,matr3D,fibstack,normalization,lut,uplim,botlim,bright,dark)
% normalization：'2D' or '3D' or 'none';

[sz1,sz2,sz3] = size(matr3D);

for z = 1:sz3
    ima = fibstack(:,:,z);
    switch normalization
        case '2D'
            imageuniq = ima/max(ima(:));
        case '3D'
            imageuniq = ima/max(fibstack(:));
        case 'none'
            imageuniq = ima;
    end

    prettypic = prettymap(matr3D(:,:,z),imageuniq,'none',lut,uplim,botlim,bright,dark);
    imwrite(double(prettypic),[savepath,num2str(z),'.tif'],'tif')
end

%
end