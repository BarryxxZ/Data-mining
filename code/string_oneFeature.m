function [ string ] = string_oneFeature( ordered_features )
%Based on the ordered matrix of features with mutual information, generates
%a user-friendly message with the results
s='The most relevant features are the following (by order):';
s=sprintf('%s\n', s );
for i=1:1:size(ordered_features,1)
s=sprintf('%s %s with %f mutual information with the class feature\n', s, getFeature(ordered_features(i,1)), ordered_features(i,2));
end
string=s;
