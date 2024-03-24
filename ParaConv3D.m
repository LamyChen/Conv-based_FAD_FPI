%% Calculating 3D parameters using convolution method.

function result = ParaConv3D(mask,armdx)

kernel = (1/(2*armdx+1))^3*ones(2*armdx+1,2*armdx+1,2*armdx+1);
result = convn(mask, kernel, 'same');

end