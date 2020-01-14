function tiles = split(img, s)
[YY, XX] = size(img);

tiles = zeros(ceil(YY/s), ceil(XX/s), s, s);

for j = 1:s:YY
    for i = 1:s:XX
        if j+7 <= YY && i+7 <= XX
            tiles( ceil(j/s), ceil(i/s),:,:) = img(j:j+7, i:i+7);
        end
    end
end

end

