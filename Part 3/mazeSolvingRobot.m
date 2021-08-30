
#Rewards table
% -inf = no door between the rooms

R = [0, 0, -1, -1;
     0, 0, 0, -inf;
     -inf, 0, 0, -inf;
     0, -inf, -inf, -inf;
     0, 0, 0, -inf;
     0, 0, 0, 0;
     -inf, -inf, 0, 0;
     0, 0, -inf, 0;
     0, -inf, -inf, 0;
     0, 100, 0, 0;
     -inf, 0, 0, 0;
     -inf, -inf, -inf, 0;
     0, -inf, -inf, 0;
     -inf, -inf, 0, -inf];

%Goal State is (3,1). Since in Octave Index starts from 1, index correspond to (3,1) is 13
goalState = 13;

% the learning Rate [0,1]
gamma=  0.8;


Q= zeros(size(R));

for episode=1:3
    %Select a random initial state 
  state=4;

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