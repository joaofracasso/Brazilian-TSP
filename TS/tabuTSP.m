%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA116
% Project Title: Implementation of Tabu Search for TSP
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%


%% Problem Definition
function [melhorSolucao, resultadoMelhorSolucao, tempoDuracao] = tabuTSP(nIteracoes,instancia,target)
[numeroCidades, ~ , ~, databaseTSP] =  abrirInstancia(instancia); 

ActionList=CreatePermActionList(numeroCidades);    % Action List
nAction=numel(ActionList);              % Number of Actions


%% Tabu Search Parameters

TL=round(0.5*nAction);      % Tabu Length


%% Initialization

% Create Empty Individual Structure
empty_individual.Position=[];
empty_individual.Cost=[];

% Create Initial Solution
sol=empty_individual;
sol.Position=randperm(numeroCidades);
sol.Cost=avaliarSolucao(sol.Position,databaseTSP);

% Initialize Best Solution Ever Found
BestSol=sol;

% Array to Hold Best Costs
BestCost=zeros(nIteracoes,1);

% Initialize Action Tabu Counters
TC=zeros(nAction,1);


%% Tabu Search Main Loop
t = 0;
t1 = clock;
while (~isequal(t,nIteracoes) && (etime(clock,t1)<900))
    t = t+1;
    bestnewsol.Cost=inf;
    % Apply Actions
    for i=1:nAction
        if TC(i)==0
            newsol.Position=DoAction(sol.Position,ActionList{i});
            newsol.Cost=avaliarSolucao(newsol.Position,databaseTSP);
            newsol.ActionIndex=i;

            if newsol.Cost<=bestnewsol.Cost
                bestnewsol=newsol;
            end
        end
    end
    
    % Update Current Solution
    sol=bestnewsol;
    
    % Update Tabu List
    for i=1:nAction
        if i==bestnewsol.ActionIndex
            TC(i)=TL;               % Add To Tabu List
        else
            TC(i)=max(TC(i)-1,0);   % Reduce Tabu Counter
        end
    end
    
    % Update Best Solution Ever Found
    if sol.Cost<=BestSol.Cost
        BestSol=sol;
        t2 = clock;
        tempoDuracao = etime(t2,t1);
    end
    
    % Save Best Cost Ever Found
    BestCost(t)=BestSol.Cost;
    
    if (BestCost(t) <= target)
          break;
    end
    disp(['Iteration ' num2str(t) ': Best Cost = ' num2str(BestCost(t))]);
    

    
end
melhorSolucao = BestSol.Position;
resultadoMelhorSolucao=BestSol.Cost;
end
