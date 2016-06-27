function y = diffarray(Array)
% DIFFARRAY Finds the absolute difference between each value within an array
% Takes one input as a regular Array. ie [30,20,10]
% It spits out a regular array
%
% Works with cell arrays!
%
% TODO: - have it not repeat calculations
%
% Written by: Kyle Gauder


% Check whether input is a cell array,
% if yes: change to normal array.
A = Array;
if iscell(A) == 1
    A = cell2mat(A);
end
[ASizeRow,ASize] = size(A);

for i=1:ASize
    if i == (ASize)
        break;
    else
        for n=1:(ASize-1)
            current = A(i);
            next = A(n+1);
            holder(i,n) = abs(current - next);
        end
    end
end
y = holder;
end
