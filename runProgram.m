function runProgram(varargin)
fun_handles = {@similar};

runTests(varargin, fun_handles);

function similar()
mkdir data_mod;
copyfile data data_mod;

a=dir(['data_mod' '/*.jpg']);
out=size(a,1);
counter = 1;
while out >= 3 %Possibly adjust for differences in number of similar images
    counterString = string(counter);
    name = 'similar';
    dirName = strcat(name, counterString);
    mkdir(dirName);

    find_similar(dirName);
    counter = counter + 1;
    a=dir(['data_mod' '/*.jpg']);
    out=size(a,1);
end