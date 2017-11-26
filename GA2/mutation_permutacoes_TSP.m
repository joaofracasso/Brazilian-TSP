function [offspring] = mutation_permutacoes_TSP(offspring_c, pm,dist)  
    offspring = offspring_c;    
    
    for i=1:size(offspring_c,1)
        prob = rand(1);
        if prob <= pm
            p = offspring_c(i,:);
            [p,~] = exchange2(p,dist);
            offspring(i,:) = p;
        end
    end
end