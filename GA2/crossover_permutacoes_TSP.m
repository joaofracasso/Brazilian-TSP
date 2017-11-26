function [offspring_c] = crossover_permutacoes_TSP(chrom_pop, pc,dados)
    offspring_c = zeros(0,size(chrom_pop,2));

    for i=1:round(size(chrom_pop,1))
        parents = randperm(size(chrom_pop,1),2);
        
        prob_c = rand(1);
        
        if prob_c <= pc
            offspring1 = zeros(1,size(chrom_pop,2));
            offspring2 = zeros(1,size(chrom_pop,2));

            EdgeMap = cell(size(chrom_pop,2),1);

            p1 = chrom_pop(parents(1),:);
            p2 = chrom_pop(parents(2),:);

            % Create the Edge Map
            for j=1:size(chrom_pop,2)
                city_1 = find(p1 == j);
                city_2 = find(p2 == j);

                if city_1 > 1 && city_1 < size(chrom_pop,2)
                    adjacentes = [p1(1,city_1 - 1) p1(1,city_1 + 1)];
                elseif city_1 == 1
                    adjacentes = [p1(1,city_1 + 1) p1(1,end)];
                elseif city_1 == size(chrom_pop,2)
                    adjacentes = [p1(1,1) p1(1,city_1 - 1)];
                end

                if city_2 > 1 && city_2 < size(chrom_pop,2)
                    adjacentes = horzcat(adjacentes, p2(1,city_2 - 1), p2(1,city_2 + 1));
                elseif city_2 == 1
                    adjacentes = horzcat(adjacentes, p2(1,city_2 + 1), p2(1,end));
                elseif city_2 == size(chrom_pop,2)
                    adjacentes = horzcat(adjacentes, p2(1,1), p2(1,city_2 - 1));
                end

                EdgeMap{j,1} = adjacentes;                                                
            end

            % Determine the offspring

            for j=1:2
                offspring = zeros(1,size(chrom_pop,2));

                % First city selected randomly
                pos = randperm(size(chrom_pop,2),1);
                offspring(1,1) = pos;

                for k = 2:size(chrom_pop,2)
                    adjacent = setdiff(EdgeMap{pos,1},offspring);

                    while isempty(adjacent)
                        pos = randperm(size(chrom_pop,2),1);
                        adjacent = setdiff(EdgeMap{pos,1},offspring);
                    end

                    dist = zeros(length(adjacent),1);

                    for m=1:length(adjacent)
                        dist(m,1) = dados(pos,adjacent(m));
                    end

                    [~,Imax] = min(dist);

                    offspring(1,k) = adjacent(Imax);
                    pos = adjacent(Imax);
                end

                if j == 1
                    offspring1 = offspring;
                else
                    offspring2 = offspring;
                end
            end                        
        else
            offspring1 = chrom_pop(parents(1,1),:);
            offspring2 = chrom_pop(parents(1,2),:);
        end
            
        if isempty(offspring_c)
            offspring_c = vertcat(offspring1,offspring2);
        else
            offspring_c = vertcat(offspring_c,offspring1,offspring2);
        end      
    end
end