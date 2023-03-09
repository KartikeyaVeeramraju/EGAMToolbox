%{
% FUNCTION:     getRmatrix

% DESCRIPTION: constructs a resistance matrix at two frequencies and their
harmonics. It takes skin effect into consideration and builds an R matrix 

% INPUTS:       Rlf: Low frequency resistance
                Rhf: High freuqency resistance
                pflags: number of p axis components.
                rflags: number of r axis components
% OUTPUT:       R: resistance matrix
% ERRORS:    

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function R = getRmatrix(Rlf, Rhf, pflags, rflags)

R = zeros((2*length(pflags)-1) , (2*length(pflags)-1));
j = 1;
for i = 1:1:length(pflags)
    % low frequency resistance
    if ((abs(pflags(i)) >= 0) && rflags(i) == 0)
         if pflags(i) == 0 && rflags(i) == 0
            R(j,j) = Rlf;
         elseif pflags(i) >= 0 && rflags(i) == 0
            R(j,j) = Rlf;
            R(j+1,j+1) = Rlf;
         end
    elseif ((abs(pflags(i)) >= 0) && rflags(i) >= 1)
        R(j,j) = Rhf*sqrt(rflags(i));
        R(j+1,j+1) = Rhf*sqrt(rflags(i));
    end

    if pflags(i) == 0 && rflags(i) == 0
        j = j+1;
    else
        j= j+2;
    end
end

end