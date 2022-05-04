function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin ~= 2
    error('error,invalid number of inputs')
end
c=1
r=1

for i=1:n;
    A(r,c)=i;
    r=r+1;
end
c=1;
r=1;
for i=1:m;
    A(r,c)=i;
    c=c+1;
end
c=2;
r=2;
for i=1:n-1;
    for i = 1:m-1;
    A(r,c)= A(r,c-1) + A(r-1,c);
    c=c+1;
    end
    r=r+1;
    c=2;
end
disp(A)


% Now the real challenge is to fill in the correct values of A


end