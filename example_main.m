%% load sequence
path = 'D:\raw_imgpath\';   %modify
stack = load_sequence(path,'','%03d');

stack = stack/max(stack(:));
% [sz1,sz2,sz3] = size(stack);

%% preprocess
stackmean = preprocessing(stack);

%% binarization
finalmask = stack2fm(stackmean);
%% calc FAD
windowsize = 200;   %modify
armdx = ceil((windowsize-1)/2);

FAD = ParaConv3D(finalmask,armdx);
disp('FAD finished')

%% calc FPI
outline = edge3(finalmask,'approxcanny',0.6);

FPI = ParaConv3D(outline,armdx);
disp('FPI finished')

%% draw pretty 3D
bright = 0.99;
dark = 0.01;
normalization = 'none';
colorMap = jet(64);     %modify
    
draw_prettymap3D([path,'FAD\'],FAD,stackmean,normalization,colorMap,1,0,bright,dark)
draw_prettymap3D([path,'FPI\'],FPI,stackmean,normalization,colorMap,0.1,0,bright,dark)