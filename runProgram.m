function runProgram(varargin)
fun_handles = {@similar};

runTests(varargin, fun_handles);

function similar()
mkdir data_mod;
copyfile data data_mod;

a=dir(['data_mod' '/*.jpg']);
out=size(a,1);
while out >= 3 %Possibly adjust for differences in number of similar images
    find_similar();
    a=dir(['data_mod' '/*.jpg']);
    out=size(a,1);
end