function  finalmask = stack2fm(stack)

[sz1,sz2,sz3] = size(stack);

finalmask = zeros(sz1,sz2,sz3);
for j = 1:sz3 
    T = graythresh(stack(:,:,j));
    finalmask(:,:,j) = imbinarize(stack(:,:,j),T);
    finalmask(:,:,j) = miprmdebrisn(finalmask(:,:,j),15);

    holesize = 25;  %modify
    finalmask(:,:,j) = fill_holes(finalmask(:,:,j),holesize);
end
finalmask = logical(finalmask); 


end