function LUT(obraz, przekodowanie)
%HELPFUNC Summary of this function goes here
%   Detailed explanation goes here
    ImgIntlut = intlut(obraz, przekodowanie);
    subplot(2,2,1:2);
    plot(przekodowanie);
    title("Przekodowanie");
    subplot(2,2,3);
    imshow(obraz);
    title("Originalny obraz");
    subplot(2,2,4);
    imshow(ImgIntlut);
    title("Obraz po przekodowaniu");
end

