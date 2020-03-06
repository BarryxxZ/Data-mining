function [ data_matrix ] = LoadMammographicMassesData(  )
%Loads Mammographic Masses data into a data matrix

filename = 'mammographic_masses.data';
delimiterIn = ',';
headerlinesIn = 1;
A = importdata(filename,delimiterIn);

[BI_RADSAssessment, Age, Shape, Margin, Density, Severity]=textread('mammographic_masses.data','%s%s%s%s%s%f','delimiter',',');

BI_RADSAssessment_modified=strrep(BI_RADSAssessment, '?', '200');
BI_RADSAssessment=convertToInteg( BI_RADSAssessment_modified );

Age_modified=strrep(Age, '?', '200');
Age=convertToInteg( Age_modified );

Shape_modified=strrep(Shape, '?', '200');
Shape=convertToInteg( Shape_modified );

Margin_modified=strrep(Margin, '?', '200');
Margin=convertToInteg( Margin_modified );

Density_modified=strrep(Density, '?', '200');
Density=convertToInteg( Density_modified );

%group the data into a data matrix
data_mammographicMasses=[BI_RADSAssessment, Age, Shape, Margin, Density, Severity];
%remove instances with missing values
TF1 = data_mammographicMasses(:,1)==200;
TF2 = data_mammographicMasses(:,2)==200;
TF3 = data_mammographicMasses(:,3)==200;
TF4 = data_mammographicMasses(:,4)==200;
TF5 = data_mammographicMasses(:,5)==200;
TF6 = data_mammographicMasses(:,6)==200;
TFall = TF1 | TF2 | TF3 | TF4 | TF5 | TF6; 
data_mammographicMasses(TFall,:) = [];

data_matrix=data_mammographicMasses;

end

