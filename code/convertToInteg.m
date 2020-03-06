function [ final_vector ] = convertToInteg( vector )
%Converts the vectors strings in numbers

%vhigh->4, high->3, med->2, low->1, more->100, big->3, 5more->5, small->1
s=size(vector);
iteration=s(1);
final=zeros(iteration,1);

for i=1:1:iteration
    final(i,1)=str2double(vector(i)); 
end

final_vector=final;

