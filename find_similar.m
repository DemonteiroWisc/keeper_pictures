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


imageIndex = indexImages(test_images);

queryDir = fullfile(dataDirectory, filesep);
queryImage = imread([queryDir 'similar2_1.JPG']);

[imageIDs, scores] = retrieveImages(queryImage,imageIndex,'NumResults',Inf);

bestMatchesGallery = [];
for i = 1:length(imageIDs)
    if (scores(i) >= 0.10) %FIX THRESHOLD
        match = imageIDs(i);
        matchImage = imread(imageIndex.ImageLocation{match});
        thumbnail = imresize(matchImage,[450 600]);
        bestMatchesGallery = cat(4,bestMatchesGallery,thumbnail);
    end
end
figure
montage(bestMatchesGallery);

% bestMatch = imageIDs(1);
% bestImage = imread(imageIndex.ImageLocation{bestMatch});
% 
% figure
% imshowpair(queryImage, bestImage, 'montage');
end

