function [ feature ] = getFeature( i )
%gets the feature based on the iteration
        if i==1
            feature='Clump Thickness';
        else
           if i==2
               feature='Uniformity of Cell Size';
           else
              if i==3
                  feature='Uniformity of Cell Shape';
              else
                 if i==4
                     feature='Marginal Adhesion';
                 else
                    if i==5
                        feature='Single Epithelial Cell Size';
                    else
                       if i==6
                           feature='Bare Nuclei';
                       else
                          if i==7
                              feature='Bland Chromatin';
                          else
                             if i==8
                                 feature='Normal Nucleoli';
                             else
                                if i==9
                                    feature='Mitoses';
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

