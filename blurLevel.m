function [blur] = blurLevel(imagePath)

blur = 0;

image = imread(imagePath);
grayImage = rgb2gray(image);

%find bluriness level by seeing amount of sharp and clear edges
[lpImage, ~] = imgradient(grayImage);

nPx = round(0.001*numel(image));
sortedImage = sort(lpImage(:));
measureImage = median(sortedImage(end-nPx+1:end));

%divide by 1000 to combine with score from brightnessLevel
blur = measureImage ./ 1000;
end

