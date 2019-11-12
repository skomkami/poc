function vec = convolution_local(data, local_window)
%CONVOLUTION_LOCAL Summary of this function goes here
%   Detailed explanation goes here

h = fspecial('gaussian', local_window, 0.25);

Nx = length(data)/local_window(1);

for i = 1:Nx
    
   patch = reshape(data(:,i), local_window);
   
   [rows, cols] = find(patch == patch);
   rows = reshape(rows, local_window);
   cols = reshape(cols, local_window);
   Ncy = ceil(local_window(1)/2);
   Ncx = ceil(local_window(2)/2);
   dist = sqrt((Ncy-rows).^2 + (Ncx -cols).^2);
   
   data_filtered(i) = sum(sum(patch .* h));
 x
end
end

