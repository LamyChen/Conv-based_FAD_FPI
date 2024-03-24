function [stackmean] = preprocessing(stack)
[sz1,sz2,sz3] = size(stack);
%% enhancement

for z = 1:sz3
    stack(:,:,z) = imadjust(stack(:,:,z));
end

%% 
d = 3; %modify
stackpad = zeros(sz1,sz2,sz3+2*d);
stackpad(:,:,d+1:d+sz3) = stack;
stackpad(:,:,1:d) = repmat(stack(:,:,1), [1, 1, d]);
stackpad(:,:,sz3+d+1:sz3+2*d) = repmat(stack(:,:,sz3), [1, 1, d]);

stackmean = zeros(sz1,sz2,sz3);
for i = 1:sz3
    stackmean(:,:,i) = mean(stackpad(:,:,(i):(i+2*d)),3);
end

end