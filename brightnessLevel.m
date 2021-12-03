function [bright] = brightnessLevel(imagePath)

image = imread(imagePath);

bright = 0;

brightness = mean2(image);

%divide by 100 to combine with score from brightnessLevel
bright = brightness ./ 100;

%grayImage = rgb2gray(thisFrame);
%meanGrayLevels(frame) = mean(grayImage(:));
end

