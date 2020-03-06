function [ index ] = count_ocurrencies( unique_matrix, complete_matrix )
%count the number of ocurrencies of a row
s=size(unique_matrix);
c=zeros(s(1),1);
for i=1:1:s(1)
    c(i)=sum(ismember(complete_matrix,unique_matrix(i,:),'rows'));
end
index=c;

