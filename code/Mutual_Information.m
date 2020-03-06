function [ Iij ] = Mutual_Information( joint_prob, unique_combination, x_column, y_column )
%Calculation of the mutual information between features x and y
    x=transpose(x_column);
    [a x_values]=hist(x, unique(x));
    total=sum(a);
    probabilities_x=a./total;
    
    y=transpose(y_column);
    [a y_values]=hist(y, unique(y));
    total=sum(a);
    probabilities_y=a./total;
    s=size(unique_combination);
    for i=1:1:s(1)
        row=unique_combination(i,:);
        number=row(1);
        [Lia,index] = ismember(number,x_values);
        px=probabilities_x(index);
  
        number=row(2);
        [Lia,index] = ismember(number,y_values);
        py=probabilities_y(index);
        
        mutual_information_aux(i)=joint_prob(i,:)*log2(joint_prob(i,:)/(px*py));
    end
    Iij=sum(mutual_information_aux);

end

