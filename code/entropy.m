function [ H ] = entropy( p_input, base )
%entropy.m  -  By: Bernardo Gomes (bernardo.n.gomes@tecnico.ulisboa.pt)
%----------------------------------------------------
%computes the entropy of a generic discrete random 
%variable given its probability mass function [p1, p2,?,pN].
%---------------------------------------------------------------
%Computation of the ln of eah probability given in the vector
if nargin < 2
   base = 2;
end
d=log2(base);
lns=log2(p_input)/d;
%-----------------------------------------------------------

%Multiplication of the probability by its ln
p=p_input.*lns;
%---------------------------------------------
p=-p;
%By now, each element of the sum is calculated

%Calulation of the sum
H=sum(p);

end

