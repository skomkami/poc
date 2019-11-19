function data_filtered = convolution_local(data, local_window)
%CONVOLUTION_LOCAL Summary of this function goes here
%   Detailed explanation goes here

h = fspecial('gaussian', local_window, 25);

Nx = size(data,2);

for i = 1:Nx
   patch = reshape(data(:,i), local_window);
   data_filtered(i) = sum(sum(patch .* h));
end
end

