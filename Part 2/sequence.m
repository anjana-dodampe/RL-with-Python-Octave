
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


goalState = 7;

% the learning Rate [0,1]
gamma=  0.7;

Q= zeros(size(R));


seq = [3, 4, 7, 10, 12];
       
for episode = 1:size(seq,1)
  episode
  state = seq(episode,1); %initial state
  
  
  
  i = 2;
  while state ~= goalState
    action = seq(episode,i);
    state
   
    
    qMax = max(Q, [], 2);
    Q(state, action) = R(state, action) + gamma*qMax(action);
    state = action;
    i = i +1;
    
    
  end
  
end  

Q