function resultImg = getShape(indexed, shape)
[YY, XX] = size(indexed);

resultImg = indexed;
coeffs = obliczWspolczynniki(indexed);

for j = 1:YY
    
    flag = false;
    
    for i = 1:XX
        pixel = indexed(j,i);
        
        switch shape
            case 'square'
                if (pixel ~= 0 && ~(coeffs(pixel,2) < 0.85 && coeffs(pixel,2) > 0.7))
                    resultImg(j,i) = 0;
                end
            case 'circle'
                if (pixel ~= 0 && ~(coeffs(pixel,2) < 1 && coeffs(pixel,2) > 0.85))
                    resultImg(j,i) = 0;
                end
            case 'cross'
                if (pixel ~= 0 && ~(coeffs(pixel,2) < 0.65 && coeffs(pixel,2) > 0.57))
                    resultImg(j,i) = 0;
                end
            case 'triangle'
                if (pixel ~= 0 && ~(coeffs(pixel,2) < 0.57 && coeffs(pixel,2) > 0.50))
                    resultImg(j,i) = 0;
                end
            case 'L'
                if (pixel ~= 0 && ~(coeffs(pixel,2) < 0.5 && coeffs(pixel,2) > 0.4))
                    resultImg(j,i) = 0;
                end
            otherwise
                fprintf('Unknown shape')
                flag = true;
                break
        end
    end
    
    if flag
        break
    end
    
end

end

