function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if 6==3
    error('eijr')
end
time = x

lengthx=length(x)%% how many times are there
lengthy=length(y) %% how many outputs are there, should be the same as time
timeI=x(1,1)      %% initial time value
timeF=x(lengthx)%% final time value
x0 = x(1)
x1 = x(2)
h=x1-x0
if lengthx ~= lengthy 
    error('amount of inputs do not equal amount of outputs')   %% checks to see of the # of ins match # of outs
end

xspaced = linspace(timeI, timeF, lengthx)




for s = 3 : lengthx                       %starts on 3 because the first two points is concidered the right spacing
   if (x(s) - x(s-1))  ~= h 
       error('x is not evenly spaced')
    end
end


    


numerator = y(1)
twobeforeend=lengthx-2
for i = 2 : twobeforeend                              % only iterates until the final 2 points because the final segment is ambiguous 
    if rem(i,2) == 0 
        numerator = numerator + (4.*(y(i)))              %%%%%% this section evaluates the numerator if there is an even amount of segments
    end
    if rem(i,2) ~= 0
        numerator = numerator + (2.*(y(i)))
    end   
end



if rem(lengthy,2) ~= 0                                              %% odd number of data points so 1/3 will work, finish the numerator with final two points 
    numerator = numerator + 4.*(y(lengthy-1)) + y(lengthy)
    I = numerator .* (h./3)
end



if rem(lengthy,2) == 0                                  %% even number of data points so odd number of intervals we need to use trapz
    warning('trapezoidal method will be used for the remainder segment')
    numerator = numerator + y((lengthy-1))  
    I = (numerator.*(h./3)) + ((y(lengthy)-y(lengthy-1)).*(h./2))
end

end