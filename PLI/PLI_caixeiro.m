function [costopt,best,tempoDuracao] = PLI_caixeiro(instancia)
    [numeroCidades, ~ , ~, databaseTSP] =  abrirInstancia(instancia);
     
    t = 0;
    t1 = clock;
    idxs = nchoosek(1:numeroCidades,2);
    idxs = vertcat(idxs,idxs(:,[2 1]));

    dist = zeros(length(idxs),1);

    for k=1:length(idxs)
        dist(k,1) = databaseTSP(idxs(k,1),idxs(k,2));
    end
    
    lendist = length(dist);

    % Equality Constraints
    Aeq = spones(1:length(idxs)); % Adds up the number of trips
    beq = numeroCidades;

    Aeq = [Aeq;spalloc(numeroCidades,length(idxs),numeroCidades*(numeroCidades-1))]; % allocate a sparse matrix
    for k = 1:2
        for ii = 1:numeroCidades
            whichIdxs = (idxs(:,k) == ii); % find the trips that include stop ii
            whichIdxs = sparse(sum(whichIdxs,2)); % include trips where ii is at either end
            
            if k == 1            
                Aeq(ii+1,:) = whichIdxs'; % include in the constraint matrix
            else
                Aeq(numeroCidades+ii+1,:) = whichIdxs'; % include in the constraint matrix
            end
        end
    end
    beq = [beq; ones(2*numeroCidades,1)];

    % Binary Bounds
    intcon = 1:lendist;
    lb = zeros(lendist,1);
    ub = ones(lendist,1);
    
    % Optimize using intlinprog
    opts = optimoptions('intlinprog','Display','off');
    [x_tsp,costopt] = intlinprog(dist,intcon,[],[],Aeq,beq,lb,ub,opts);

    % Visualize the solution
    
    segments = find(x_tsp); % Get indices of lines on optimal path
    %title('Solution with Subtours');
    
    % Subtour constraints
    tours = detectSubtours(x_tsp,idxs);
    numtours = length(tours); % number of subtours

    A = spalloc(0,lendist,0); % Allocate a sparse linear inequality constraint matrix
    b = [];
    while numtours > 1 % repeat until there is just one subtour
        % Add the subtour constraints
        b = [b;zeros(numtours,1)]; % allocate b
        A = [A;spalloc(numtours,lendist,numeroCidades)]; % a guess at how many nonzeros to allocate
        for ii = 1:numtours
            rowIdx = size(A,1)+1; % Counter for indexing
            subTourIdx = tours{ii}; % Extract the current subtour
    %         The next lines find all of the variables associated with the
    %         particular subtour, then add an inequality constraint to prohibit
    %         that subtour and all subtours that use those stops.
            variations = nchoosek(1:length(subTourIdx),2);
            variations = vertcat(variations,variations(:,[2 1]));
            for jj = 1:length(variations)
                whichVar = (sum(idxs==subTourIdx(variations(jj,1)),2)) & ...
                           (sum(idxs==subTourIdx(variations(jj,2)),2));
                A(rowIdx,whichVar) = 1;
            end
            b(rowIdx) = length(subTourIdx)-1; % One less trip than subtour stops
        end

        % Try to optimize again
        [x_tsp,costopt] = intlinprog(dist,intcon,A,b,Aeq,beq,lb,ub,opts);

        % How many subtours this time?
        tours = detectSubtours(x_tsp,idxs);
        numtours = length(tours); % number of subtours
    end

    % Display results
    segments = find(x_tsp); % Get indices of lines on optimal path
    best = tours{1};   
    t2 = clock;
    tempoDuracao = etime(t2,t1);
    
    
end

