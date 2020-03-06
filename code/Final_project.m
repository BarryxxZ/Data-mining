%Final Project 

%--------------------------------------------
%%

%beginning
clc;
clear all;
close all;
%--------------------------------------------
%Load Breast Cancer Wisconsin (Original) Data Set
data_BreastCancer=LoadBreastCancerData(  );
%----------------------------------------------------------
%%
%Feature selection
X=data_BreastCancer(:, 2:10);
Y=data_BreastCancer(:, 11);

%Compute entropy of each feature
H=zeros(1, size(X,2));%allocate vector for each dimension entropy
for i=1:1:size(X,2)
    x=transpose(X(:,i));
    [a b]=hist(x, unique(x));
    total=sum(a);
    probabilities=a./total;
    H(i)=entropy(probabilities,2);
    fprintf( 'The entropy of %s is %f\n', getFeature(i), H(i));
%     figure
%     stem(b,probabilities)
%     title(['Probability mass function of ', getFeature(i)])
%     ylabel('probability')
end
fprintf( '-------------------------------------------------------------\n\n');

%Compute Mutual Information between each feature and the class feature
Mutual_information=zeros(1,size(X,2));
for i=1:1:size(X,2)
    x=X(:,i);
    y=Y;
    d=[x y];
    %get different row ocurrencies
    dif=unique(d, 'rows');
    %count the number of ocurrencies of a row
    counts=count_ocurrencies(dif, d);
    %calculate joint pmf
    total=sum(counts);
    probabilities=counts./total;
    %Calculation of mutual information
    Mutual_information(i)=Mutual_Information(probabilities, dif, X(:,i), Y);
end
ordered_features=[[1;2;3;4;5;6;7;8;9] Mutual_information'];
ordered_features=sortrows(ordered_features,-2);
disp(string_oneFeature(ordered_features));
fprintf('--------------------------------------------------------------\n\n');

%Compute Mutual information between two features and the class feature
Mutual_information_2=zeros(size(X,2),size(X,2));
max_2=0;
ind=zeros(1,2);
for i=1:1:(size(X,2)-1)
    for j=i+1:1:size(X,2)
        
            x=X(:,i);
            y=X(:,j);
            d=[x y Y];
            %get different row ocurrencies
            dif=unique(d, 'rows');
            s=size(dif);
            %count the number of ocurrencies of a row
            counts=count_ocurrencies(dif, d);
            %calculate joint pmf
            total=sum(counts);
            probabilities=counts./total;
            
            %calculation of mutual information
            Mutual_information_2(i,j)=Mutual_Information_multi(probabilities, dif, [X(:,i) X(:,j)], Y);
            if max_2< Mutual_information_2(i,j)
               max_2= Mutual_information_2(i,j);
               ind(1)=i;
               ind(2)=j;
            end
    end
end
fprintf('The most relevant association of 2 features is %s with %s with a mutual information of %f\n', getFeature(ind(1)), getFeature(ind(2)), max_2);
fprintf('-----------------------------------------------------------\n\n');

%Compute Mutual information between three features and the class feature
max_3=0;
ind_3=zeros(1,3);
for i=1:1:(size(X,2)-2)
    for j=i+1:1:(size(X,2)-1)
        for k=j+1:1:size(X,2)
            if i~=j && i~=k && j~=k
                x=X(:,i);
                y=X(:,j);
                third=X(:,k);
                d=[x y third Y];
                %get different row ocurrencies
                dif=unique(d, 'rows');
                s=size(dif);
                %count the number of ocurrencies of a row
                counts=count_ocurrencies(dif, d);
                %calculate joint pmf
                total=sum(counts);
                probabilities=counts./total;

                %calculation of mutual information
                Mutual_information_3=Mutual_Information_multi(probabilities, dif, [X(:,i) X(:,j) X(:,k)], Y);
                if max_3< Mutual_information_3
                   max_3= Mutual_information_3;
                   ind_3(1)=i;
                   ind_3(2)=j;
                   ind_3(3)=k;
                end
            end
        end    
     end
end
fprintf('The most relevant association of 3 features is %s with %s and %s with a mutual information of %f\n', getFeature(ind_3(1)), getFeature(ind_3(2)), getFeature(ind_3(3)), max_3);
fprintf('-----------------------------------------------------------\n\n');

%Compute Mutual information between four features and the class feature
max_4=0;
ind_4=zeros(1,4);
for i=1:1:(size(X,2)-3)
    for j=i+1:1:(size(X,2)-2)
        for k=j+1:1:(size(X,2)-1)
            for z=k+1:1:size(X,2)
                if i~=j && i~=k && i~=z && j~=k && j~=z
                    x=X(:,i);
                    y=X(:,j);
                    third=X(:,k);
                    fourth=X(:,z);
                    d=[x y third fourth Y];
                    %get different row ocurrencies
                    dif=unique(d, 'rows');
                    s=size(dif);
                    %count the number of ocurrencies of a row
                    counts=count_ocurrencies(dif, d);
                    %calculate joint pmf
                    total=sum(counts);
                    probabilities=counts./total;

                    %calculation of mutual information
                    Mutual_information_4=Mutual_Information_multi(probabilities, dif, [X(:,i) X(:,j) X(:,k) X(:,z)], Y);
                    if max_4< Mutual_information_4
                       max_4= Mutual_information_4;
                       ind_4(1)=i;
                       ind_4(2)=j;
                       ind_4(3)=k;
                       ind_4(4)=z;
                    end
                end
            end
        end    
     end
end
fprintf('The most relevant association of 4 features is %s with %s and %s and %s with a mutual information of %f\n', getFeature(ind_4(1)), getFeature(ind_4(2)), getFeature(ind_4(3)), getFeature(ind_4(4)), max_4);
fprintf('-----------------------------------------------------------\n\n');


%Compute Mutual information between five features and the class feature
max_5=0;
ind_5=zeros(1,5);
for i=1:1:(size(X,2)-4)
    for j=i+1:1:(size(X,2)-3)
        for k=j+1:1:(size(X,2)-2)
            for z=k+1:1:(size(X,2)-1)
                for q=z+1:1:size(X,2)
                    if i~=j && i~=k && i~=z && i~=q && j~=k && j~=z && j~= q && z~=q
                        x=X(:,i);
                        y=X(:,j);
                        third=X(:,k);
                        fourth=X(:,z);
                        fifth=X(:,q);
                        d=[x y third fourth fifth Y];
                        %get different row ocurrencies
                        dif=unique(d, 'rows');
                        s=size(dif);
                        %count the number of ocurrencies of a row
                        counts=count_ocurrencies(dif, d);
                        %calculate joint pmf
                        total=sum(counts);
                        probabilities=counts./total;

                        %calculation of mutual information
                        Mutual_information_5=Mutual_Information_multi(probabilities, dif, [X(:,i) X(:,j) X(:,k) X(:,z) X(:,q)], Y);
                        if max_5< Mutual_information_5
                           max_5= Mutual_information_5;
                           ind_5(1)=i;
                           ind_5(2)=j;
                           ind_5(3)=k;
                           ind_5(4)=z;
                           ind_5(5)=q;
                        end
                    end
                end
            end
        end    
     end
end
fprintf('The most relevant association of 5 features is %s with %s and %s and %s and %s with a mutual information of %f\n', getFeature(ind_5(1)), getFeature(ind_5(2)), getFeature(ind_5(3)), getFeature(ind_5(4)), getFeature(ind_5(5)), max_5);
fprintf('-----------------------------------------------------------\n\n');


%Compute Mutual information between six features and the class feature
max_6=0;
ind_6=zeros(1,6);
for i=1:1:(size(X,2)-5)
    for j=i+1:1:(size(X,2)-4)
        for k=j+1:1:(size(X,2)-3)
            for z=k+1:1:(size(X,2)-2)
                for q=z+1:1:(size(X,2)-1)
                    for g=q+1:1:size(X,2)
                        if i~=j && i~=k && i~=z && i~=q && i~=g && j~=k && j~=z && j~= q && j~=g && z~=q && z~=g && q~=g
                            x=X(:,i);
                            y=X(:,j);
                            third=X(:,k);
                            fourth=X(:,z);
                            fifth=X(:,q);
                            sixth=X(:,g);
                            d=[x y third fourth fifth sixth Y];
                            %get different row ocurrencies
                            dif=unique(d, 'rows');
                            s=size(dif);
                            %count the number of ocurrencies of a row
                            counts=count_ocurrencies(dif, d);
                            %calculate joint pmf
                            total=sum(counts);
                            probabilities=counts./total;

                            %calculation of mutual information
                            Mutual_information_6=Mutual_Information_multi(probabilities, dif, [X(:,i) X(:,j) X(:,k) X(:,z) X(:,q) X(:,g)], Y);
                            if max_6< Mutual_information_6
                               max_6= Mutual_information_6;
                               ind_6(1)=i;
                               ind_6(2)=j;
                               ind_6(3)=k;
                               ind_6(4)=z;
                               ind_6(5)=q;
                               ind_6(6)=g;
                            end
                        end
                    end
                end
            end
        end    
     end
end
fprintf('The most relevant association of 6 features is %s with %s and %s and %s and %s and %s with a mutual information of %f\n', getFeature(ind_6(1)), getFeature(ind_6(2)), getFeature(ind_6(3)), getFeature(ind_6(4)), getFeature(ind_6(5)), getFeature(ind_6(6)), max_6);
fprintf('-----------------------------------------------------------\n\n');

%%
%Plot mutual information vs number of combinated features
a=[1; 2; 3; 4; 5; 6];
b=[ordered_features(1,2); max_2; max_3; max_4; max_5; max_6];
stem(a, b);

title('Maximum Mutual Information between a certain number of features and the class feature')
xlabel('Number of features correlated to the class feature');
ylabel('Mutual Information')

fprintf('Through the previously obtaind graph, we can select only the following 3 features: %s, %s and %s to be correlated with the class feature\n\n', getFeature(ind_3(1)),getFeature(ind_3(2)),getFeature(ind_3(3)))

%%
%Confirmation of the results through Matlab System Functions
X=data_BreastCancer(:, 2:10);
Y=data_BreastCancer(:, 11);

x_train = X(1:478, :); 
x_test = X(479:end, :);
y_train = Y(1:478); 
y_test = Y(479:end);
ypred = classify(x_test, x_train, y_train);
sum(y_test ~= ypred);
f=@(x_train, y_train, x_test, y_test) sum(y_test~=classify(x_test, x_train, y_train));

count=zeros(1,9);
for i=1:1:20
    inmodel = sequentialfs(f,X,Y);
    count=count+inmodel;
end
Final_inmodel=count>15;
[string, columns]=SpecifyFeatures(Final_inmodel);
disp(string);






%%
fprintf('-------------------------------------------------------------\n\n');

%Decision tree with 2 variables
X_meaningfull=data_BreastCancer(:, [ind(1) ind(2)]);
Y=data_BreastCancer(:, 11);
ctree=fitctree(X_meaningfull, Y);
ynew=predict(ctree, X_meaningfull);
errors=nnz(ynew-Y);

fprintf('The number of classification errors using 2 variables is %d \n\n', errors);

%Decision tree with 3 variables
X_meaningfull=data_BreastCancer(:, [ind_3(1) ind_3(2) ind_3(3)]);
Y=data_BreastCancer(:, 11);
ctree=fitctree(X_meaningfull, Y);
ynew=predict(ctree, X_meaningfull);
errors=nnz(ynew-Y);
view(ctree, 'mode', 'graph')

fprintf('The number of classification errors using 3 variables is %d \n\n', errors);

%Decision tree with 4 variables
X_meaningfull=data_BreastCancer(:, [ind_4(1) ind_4(2) ind_4(3) ind_4(4)]);
Y=data_BreastCancer(:, 11);
ctree=fitctree(X_meaningfull, Y);
ynew=predict(ctree, X_meaningfull);
errors=nnz(ynew-Y);

fprintf('The number of classification errors using 4 variables is %d \n\n', errors);

%Decision tree with 5 variables
X_meaningfull=data_BreastCancer(:, [ind_5(1) ind_5(2) ind_5(3) ind_5(4) ind_5(5)]);
Y=data_BreastCancer(:, 11);
ctree=fitctree(X_meaningfull, Y);
ynew=predict(ctree, X_meaningfull);
errors=nnz(ynew-Y);

fprintf('The number of classification errors using 5 variables is %d \n\n', errors);

