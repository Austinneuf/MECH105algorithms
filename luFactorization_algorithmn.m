function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[rows,cols]=size(A); 
if rows~=cols                           %checks if matrix is squrare
    error('matrix is not square')
end
L=eye(rows)                             
P=L                                    %create initial P matrix and assign values 

for i = 1:rows
    [~,indx]=max(abs(A(i:rows,i)));   %indx is where the max in the row is occuring at 
    indx=(indx+i)-1;
    
    
    %%%%%pivoting%%%%%%%%
       if i > 2 | i == 2 
     
        newrowL=L(i,1:i-1);
        L(i,1:indx-1)=L(indx,1:i-1);
        L(indx,1:i-1)=newrowL;
       end
            
       
     
       if indx~=i
        newrowA=A(i,:); 
        A(i,:)=A(indx,:);
        A(indx,:)=newrowA; 
       end
       
       if indx~=i 
        newrowP=P(i,:);     
        P(i,:)=P(indx,:);
        P(indx,:)=newrowP; 
       end
      
       
      
      %%%%%%%%%%%%%%%%%%%%%%
     
        for changerow=i+1:rows            
        L(changerow,i) =  (A(changerow,i))./(A(i,i));
        A(changerow,:) =  (A(changerow,:)-(L(changerow,i).*A(i,:)));
        end
       
        
end
    U=A
end