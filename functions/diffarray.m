function y = diffarray(Array)
% DIFFARRAY Finds the absolute difference between each value within an array
% Takes one input as a regular Array. ie [30,20,10]
%
% Does not work with cell arrays
%
% TODO: - have it not repeat calculations

A = Array;
[ASizeRow,ASize] = size(A);

for i=1:ASize
    if i == (ASize+1)
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