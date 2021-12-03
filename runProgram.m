function runProgram(varargin)
fun_handles = {@similar, @score};

runTests(varargin, fun_handles);

function similar()
mkdir data_mod;
copyfile data data_mod;

a=dir(['data_mod' '/*.jpg']);
out=size(a,1);
counter = 1;
while out >= 2 %Possibly adjust for differences in number of similar images
    counterString = string(counter);
    name = 'similar';
    dirName = strcat(name, counterString);
    mkdir(dirName);
    
    find_similar(dirName);
    
    %get best image out of similar images and copy to bestImages folder
    b = dir(fullfile(dirName, '*.jpg'));
    outBest = size(b,1);
    dirFiles = dir(dirName);
    bestImage = dirFiles(3).name;
    slash = '/';
    bestScore = 0;
    for i=1:outBest
        bestImageTest = dirFiles(2+i).name;
        file = strcat(dirName, slash, bestImageTest);
        fileScore = brightnessLevel(file) + blurLevel(file);
        disp(file);
        disp(fileScore);
        if fileScore > bestScore
            bestImage = bestImageTest;
            bestScore = fileScore;
        end
    end
    bestFile = strcat(dirName, slash, bestImage);
    copyfile(bestFile, 'bestImages');
    
    counter = counter + 1;
    a=dir(['data_mod' '/*.jpg']);
    out=size(a,1);
    
    %delete similar images folder
    %rmdir(dirName);
end

%rmdir('data_mod');


function score()
dirName = 'similar1';
slash = '/';
bestImageTest = 'similar1_1.JPG';
file = strcat(dirName, slash, bestImageTest);
disp(file);
score = brightnessLevel(file) + blurLevel(file);
disp(score);