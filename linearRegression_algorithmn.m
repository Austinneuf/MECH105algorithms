function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Austin Neuf ID: 835329776


%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set

%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
%xsorted=sort(x)
%ysorted=sort(y)
lengthx=length(x)
lengthy=length(y)


[ysorted, sortOrder] = sort(y);
xsorted = x(sortOrder)
%ysorted = sort(y)


%[sortedY, sortOrder] = sort(y);
%sortedX = x(sortOrder)

if lengthx ~= lengthy
    error('number of inputs does not equal number of ourputs')
end

medianx=median(x)

Q1=quantile(y,.25)
Q3=quantile(y,.75)

IQR=Q3-Q1


      b = xsorted;        
      d = ysorted 
      s=1
while s<=lengthy  
                                            %%%%%%%removing bottom outliers%%%%%%%%
   if d(s) < (Q1 - (1.5.*IQR))
       %b = xsorted;
       b(s) = [];
       
       
       %d = ysorted
       d(s) = [];
       
     lengthy=lengthy-1
       s=s-1
   end
   s=s+1
end

t=1

while t<=lengthy       
    
                                     %%%%%%%%%%%%%%removing top outliers%%%%%%%%%%%
   if d(t) > (Q3 + (1.5.*IQR))
      % b = xsorted;
       b(t) = [];
       
       %d = ysorted
       d(t) = [];
       
       lengthy=lengthy-1
       t=t-1
   end
   t=t+1
end


fX=b
fY=d
xAnswer=fX
yAnswer=fY

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sumx=sum(xAnswer)
sumy=sum(yAnswer)
sumxy=sum(xAnswer.*yAnswer)
sumxsquared=(sum(xAnswer)).^2
newlength=length(xAnswer)
sumofdasquarexvals=sum((xAnswer).^2)

slope = ((newlength.*sumxy)    -    (sumx.*sumy))       ./      ((newlength.*sumofdasquarexvals)     -      (sumxsquared))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meanx=mean(xAnswer)
meany=mean(yAnswer)
yint=meany - (slope.*meanx)
intercept=yint

sr=sum((yAnswer - ((slope.*xAnswer)+yint)).^2)
ss=sum((yAnswer-meany).^2)
Rsquared = 1 - (sr./ss)
%RsquaredAnswer=Rsquared
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fX=xAnswer
fY=yAnswer
%fY=yAnswer
end