%{
% FUNCTION:     getTmatrix

% DESCRIPTION:  generates the T matrix for application in the Generalized
                and Extended Generalized Average Models
     
% INPUTS:       pflags:  component's p axis location
                rflags:  component's r axis location
                w1: pflags' frequency in rad/sec
                w2: qflags' frequency in rad/sec

% OUTPUT:     T: T matrix  

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function T = getTmatrix(pflags, rflags, w1, w2)

% initialize the matrix
T = zeros((2*length(pflags)-1) , (2*length(pflags)-1));

%figure out how many iterations we will need to loop by
iterations = length(pflags)-1;

for i=1:iterations
    T(2*i, 2*i+1) =   pflags(i+1)*w1 + rflags(i+1)*w2; % assign the p*w1 + r*w2 component
    T(2*i+1, 2*i) = -(pflags(i+1)*w1 + rflags(i+1)*w2);% assign the -( p*w1 + r*w2 ) component
end

end