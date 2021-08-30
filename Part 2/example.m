
#Rewards table
% -inf = no door between the rooms

R = [-inf,-inf,-inf,-inf,0,-inf;
    -inf,-inf,-inf,0,-inf,100;
    -inf,-inf,-inf,0,-inf,-inf;
    -inf,0,0,-inf,0,-inf;
    0,-inf,-inf,0,-inf,100;
    -inf,0,-inf,-inf,0,100];

goalState = 6;

% the learning Rate [0,1]
gamma=  0.8;

Q= zeros(size(R));

for episode=1:1000
    %Select a random initial state 
  y=randperm(size(R,1)); %Returns correspoding dimension
  state=y(1) %Selects first element in y

  while state ~= goalState 
    actions = find(R(state,:)>=0); %Find all  actions >=0 corresponding to state
    actions
    if size(actions,2)>0
      % Select one action randomly
      i=randperm(size(actions,2));
      action=actions(i(1));
    end
  
  %Return a column vector with the max values of each rows
  qMax=max(Q,[],2);   
  
  %Compute the q values
  qMax(action)
  Q(state,action) = R(state,action)+gamma*qMax(action); 
  %Transition to the next state 
  state=action;  
  end
end 

Q

