function [ k ] = GetNumberComponents( eigenvalues )
%Gets the number of PC based on the eigenvalues obtained from PCA function
fraction=cumsum(eigenvalues)/sum(eigenvalues);
stem(fraction)
k=find(fraction>0.95,1);

end

