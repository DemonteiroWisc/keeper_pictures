function [outputArg1,outputArg2] = find_similar(inputArg1)
%FIND_SIMILAR Summary of this function goes here
%   Detailed explanation goes here

dataDirectory = fullfile('data_mod');
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

dirFiles = dir('data_mod');

queryDir = fullfile(dataDirectory, filesep);
queryImage = imread([queryDir dirFiles(3).name]);

[imageIDs, scores] = retrieveImages(queryImage,imageIndex,'NumResults',Inf);

bestMatchesGallery = [];
for i = 1:length(imageIDs)
    disp(scores(i));
    if (scores(i) >= 0.21) %FIX THRESHOLD
        match = imageIDs(i);
        matchImage = imread(imageIndex.ImageLocation{match});
        thumbnail = imresize(matchImage,[450 600]);
        bestMatchesGallery = cat(4,bestMatchesGallery,thumbnail);
        fileToDelete = imageIndex.ImageLocation{match};
        copyfile(fileToDelete,inputArg1);
        delete(fileToDelete);
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

