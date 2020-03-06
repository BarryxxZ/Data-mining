function [ indexes ] = estimate_two_clusters( unique_points, probabilities )
%Based on the unique points and its probabilities estimates the 2 clusters
%starting points by returning its rows on the unique matrix

prov_indexes=zeros(1, 2);
higher_H=0;
for i=1:1:(size(unique_points,1)-1)
    for j=i+1:1:size(unique_points,1)
        H=entropy([probabilities(i) probabilities(j)],2);
        if H>higher_H
           prov_indexes(1)=i;
           prov_indexes(2)=j;
           higher_H=H;
        end
    end
end
indexes=prov_indexes;
end

