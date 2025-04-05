function [Length_best,Route_best,Length_ave,Length_best_temp]=Information(Length_best_temp,Length_best,Distance,Tabu,Step,Ant,Route_best,Length_ave)
[Length_best_temp(Step,1),row]=min(Distance);
if Step==1
    Route_best(Step,:)=Tabu(row,:);
    Length_best(Step,1)=Length_best_temp(Step,1);
else
    if Length_best_temp(Step,1)>Length_best(Step-1,1)
        Route_best(Step,:)=Route_best(Step-1,:);
        Length_best(Step,1)=Length_best(Step-1,1); 
        %Length_best_temp(Step,1)=Length_best_temp(Step-1,1); 
        %Length_best_temp(Step,1)=Route_best(Step,1);
    else
        Route_best(Step,:)=Tabu(row,:);
        Length_best(Step,1)=Length_best_temp(Step,1);
        %Length_best_temp(Step,1)=Route_best(Step,1);
    end
end
Length_ave(Step,1)=sum(Distance)/Ant;
end

