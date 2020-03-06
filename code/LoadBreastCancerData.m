function [ data_matrix ] = LoadBreastCancerData(  )
%Loads Breast Cancer data into a data matrix

filename = 'breast-cancer-wisconsin.data';
delimiterIn = ',';
headerlinesIn = 1;
A = importdata(filename,delimiterIn);
%BareNuclei is the only feature with missing attributes
[SampleCodeNumber, ClumpThickness, UniformityOfCellSize, UniformityOfCellShape, MarginalAdhesion, SingleEpithelialCellSize, BareNuclei, BlandChromatin, NormalNucleoli, Mitoses, Class]=textread('breast-cancer-wisconsin.data','%f%f%f%f%f%f%s%f%f%f%f','delimiter',',');
BareNuclei_modified = strrep(BareNuclei, '?', '0');
BareNuclei=convertToInteg( BareNuclei_modified );

%group the data into a data matrix
data_Wisconsin=[SampleCodeNumber, ClumpThickness, UniformityOfCellSize, UniformityOfCellShape, MarginalAdhesion, SingleEpithelialCellSize, BareNuclei, BlandChromatin, NormalNucleoli, Mitoses, Class];
%remove instances with missing values
TF1 = data_Wisconsin(:,7)==0;
data_Wisconsin(TF1,:) = [];
%successfully suppressed 16 rows [confirm that on webpage there are 16 '?']
data_matrix=data_Wisconsin;

end

