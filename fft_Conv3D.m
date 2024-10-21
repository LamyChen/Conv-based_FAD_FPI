%% 频域卷积
function result = fft_Conv3D(mask,armdx)

kernel = (1/(2*armdx+1))^3*ones(2*armdx+1,2*armdx+1,2*armdx+1);

fft_img = fftn(double(mask));
fft_kernel = fftn(double(kernel), size(mask));

result = real(ifftn(fft_img .* fft_kernel));

result = result(1:size(mask, 1), 1:size(mask, 2), 1:size(mask, 3));

shift_amount = floor([-armdx, -armdx, -armdx]);
result = circshift(result, shift_amount);

end