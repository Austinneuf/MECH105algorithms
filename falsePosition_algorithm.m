function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
fl = func(xl)
fu = func(xu)
ea = 100
iter = 0

if nargin<3 
    error('at least 3 inputs reqiured') %user dosent specifify enough inputs
end

if nargin<4 
    es = 0.0001                          %user doesnt put in a error stopping point, in which case it defaults to .0001%
    maxit=200
end
if nargin<5
    maxit=200
end

if nargin > 6                           %user put too many inputs
    error('too many input args')
end

if fl == 0                             % users first guess is a root 
    root = xl 
    ea = 0
    error('xl is a root')
end

if fu == 0                             % users second guess is a root
    root = xu 
    ea = 0 % might need that thing where fx = fu GO BACK TO THIS IF ERROR
    error('xu is a root')
end

xr1=xl
while ea > es
       xr = xu - (((xl-xu).*(fu))  ./   (fl-fu))
       froot=func(xr)
       root = xr
       fx=froot
    
       if iter > maxit                  %code has looped >200 times
            iter = iter - 1
            disp ('max number of iterations')
       break,end
    
       
    
    
   
    if froot ~= 0                            %if the output to the fucntion is not 0 then it calculates the error
        ea=abs(((xr-xr1)./xr)).*100
        xr1 = xr 
        
        if (fl*froot)>0                      %output of the function and output of first guess are same sign so xroot becomes new fl
            xl = xr 
            fl=func(xl)  
        end
        if (fu*froot) > 0                %same thing but for second guess
            xu = xr 
            fu = func(xu)
        end
    
        if (fl*froot) == 0 | (fl*froot) == 0
            disp('xr is a root')
            root = xr
            ea=0
        end
    end
        
        
        
    
    
    
    
    
    
    
    if froot == 0                           %output is a root
        root = xr
        fx = froot                          
        ea = 0 
        disp('xr is a root')
    end
        
                               

    if es>ea                                    %error limit reached, nice
        root = xr
        fx=froot
    end
     
    
    iter=iter+1                                 %goes to the next iteration
   
end
    



    
    

    



    
    


end