function [ outArray, indexes ] = SpecifyFeatures( inArray )
%Based on the logical input array tells the user which features were
%selected

string='Through the Matlab built in function, the selected features are: ';
j=1;
for i=1:1:size(inArray,2)
    if inArray(i)==1
        idx(j)=i;
        j=j+1;
        if i==1
            string=sprintf('%s%s',string, 'Clump Thickness');
        else
           if i==2
               string=sprintf('%s%s',string, ', Uniformity of Cell Size');
           else
              if i==3
                  string=sprintf('%s%s',string, ', Uniformity of Cell Shape');
              else
                 if i==4
                     string=sprintf('%s%s',string, ', Marginal Adhesion');
                 else
                    if i==5
                        string=sprintf('%s%s',string, ', Single Epithelial Cell Size');
                    else
                       if i==6
                           string=sprintf('%s%s',string, ', Bare Nuclei');
                       else
                          if i==7
                              string=sprintf('%s%s',string, ', Bland Chromatin');
                          else
                             if i==8
                                 string=sprintf('%s%s',string, ', Normal Nucleoli');
                             else
                                if i==9
                                    string=sprintf('%s%s',string, ', Mitoses');
                                end
                             end
                          end
                       end
                    end
                 end
              end
           end
        end
    end
end

outArray=string;
indexes=idx;