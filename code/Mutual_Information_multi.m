function [ Iij ] = Mutual_Information_multi( joint_prob, unique_combination, x, y_column )
%Calculates the mutual information between an aggregation of several
%features and the class feature

%Calculation of the mutual information between features x and y
    
    dif=unique(x, 'rows');
    %count the number of ocurrencies of a row
    counts=count_ocurrencies(dif, x);
    %calculate pmf
    total=sum(counts);
    probabilities_x=counts./total; 
    
%     x=transpose(x_column);
%     [a x_values]=hist(x, unique(x));
%     total=sum(a);
%     probabilities_x=a./total;
    
    y=transpose(y_column);
    [a y_values]=hist(y, unique(y));
    total=sum(a);
    probabilities_y=a./total;
    s=size(unique_combination);
    for i=1:1:s(1)
        row=unique_combination(i,:);
        sz=size(row);
        number=row(1:(sz(2)-1));
        [Lia,index] = ismember(number,dif, 'rows');
        px=probabilities_x(index);
  
        number=row(sz(2));
        [Lia,index] = ismember(number,y_values);
        py=probabilities_y(index);
        
        mutual_information_aux(i)=joint_prob(i,:)*log2(joint_prob(i,:)/(px*py));
    end
    Iij=sum(mutual_information_aux);


end

