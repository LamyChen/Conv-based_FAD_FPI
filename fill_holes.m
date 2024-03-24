%% Fill holes of a specific size.
function [filled_image] = fill_holes(bw,area)

bwfilled = imfill(bw,'holes');
diff = bwfilled - bw;  
filled_valid = diff - bwareaopen(diff,area);    
filled_image = bw + filled_valid;

end