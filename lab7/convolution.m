function data_filtered = convolution(data, local_window)
%CONVOLUTION Summary of this function goes here
%   Detailed explanation goes here

FUNCTION = @(data_, local_window_)convolution_local(data_, local_window_);

data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);

end

