function [ cluster_entropy ] = Calc_Cluster_Entropy( cluster )
%based on the cluster matrix determines its entropy

%calculate pmf
total=sum(cluster(:,size(cluster,2)));
probabilities=cluster(:,size(cluster,2))./total; 

cluster_entropy=entropy(probabilities,2);


end

