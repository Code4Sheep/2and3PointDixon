function [s,m,n] = loadsim(filename1)

%% Description
%Usage [s,m,n] = loadsim(name);

%Input:

%name   = name of .mat file without the .mat suffix

%Output:

% s = complex k-space data
% m = number of rows in k-space
% n = number of columns in k-space


%----------------------------------------
%       Steve Wright 1/8/2021
%----------------------------------------
filename = strcat(filename1,'.mat');
X = whos('-file',filename);
T = struct2table(X);
for v = fieldnames(X)
    arrayname = X.(v{1});
end
X = load(filename);
arraynamefull = strcat('X.',arrayname);
myVar = eval(arraynamefull);
s = myVar;

