function [outputArg1,outputArg2] = find_similar(inputArg1,inputArg2)
%FIND_SIMILAR Summary of this function goes here
%   Detailed explanation goes here

dataDirectory = fullfile('data');
test_images = imageDatastore(dataDirectory);

thumbnailGallery = [];
for i = 1:length(test_images.Files)
    I = readimage(test_images,i);
    thumbnail = imresize(I,[450 600]);
    thumbnailGallery = cat(4,thumbnailGallery,thumbnail);
end

figure
montage(thumbnailGallery);

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

