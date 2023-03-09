%{
% FUNCTION:     generatePRflags

% DESCRIPTION:  Generates the paxis, raxis flags by taking the number of harmonics  
                the user wishes to have in the GAM simulation. 

% INPUTS:       pspan: number of p axis components.
                rspan: number of r axis components
                both imputs must be whole numbers
               

% OUTPUT:    pflags:  component's p axis location
             rflags:  component's r axis location

% ERRORS:    Error when inputs are not whole numbers   

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function [pflags, rflags] = generatePRflags(pspan, rspan)
if floor(pspan) == pspan && pspan >= 0 && floor(rspan) == rspan && rspan >= 0
    parray = 0:1:pspan;
    rarray = 0:1:rspan;

    k = 1;
    for i=1:1:pspan+1
        for j = 1:1:rspan+1
            pflags(k) = parray(i);
            rflags(k) = rarray(j);
            k = k+1;
            if parray(i) ~= 0 && rarray(j) ~= 0
                pflags(k) = -parray(i);
                rflags(k) = rarray(j);
                k = k+1;
            end
        end
    end
else
    error("Span inputs are not whole number\n")
end

end