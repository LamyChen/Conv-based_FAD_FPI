function stack = load_sequence(path,nameformat,numformat)
%%
%     file_extension = '*.tif';
% 
%     nameformat = '';
% 
%     numformat = '%d';

    
file_extension = '*.tif'; % modify
%% 
files = dir(fullfile(path, file_extension));
sz3 = numel(files);

first_image_path = fullfile(path, files(1).name);
img = imread(first_image_path);

c = length(size(img));
if c==2
    [sz1,sz2] = size(img);
elseif c==3
    [sz1,sz2,channel] = size(img);
end

%% load
if c==2
    stack = zeros(sz1,sz2,sz3);
    for  z = 1:sz3
        stack(:,:,z) = imread([path,nameformat,num2str(z,numformat),file_extension(2:end)]);
    end
elseif c==3
    stack = zeros(sz1,sz2,channel,sz3);
    for  z = 1:sz3
        stack(:,:,:,z) = imread([path,nameformat,num2str(z,numformat),file_extension(2:end)]);
    end
end

end