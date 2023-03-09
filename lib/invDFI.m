%{
% FUNCTION:    invDFI

% DESCRIPTION:   Takes a Discrete Fourier Image (DFI) in two dimensions and 
                 returns the inverse transformation result (realvec and imagvec).

example input DFI matrix:
-------------------------
              -3  -2  -1   0   1   2   3 (p axis)
               1   2   3   4   5   6   7 (column index)
  3        1               .
  2        2       Y       C
  1        3               .   X   
  0        4   .   .   A'  D   A   .   . 
 -1        5           X'  .   
 -2        6               C'      Y' 
 -3        7               .
 (r axis)  (row index)

                 D    A       C       X       Y
original vec:   [10 2   3   1.5 2   2.5 0   3   0] (example values)

realvec:        [10 2   1.5 2.5 3] (return value)
imagvec:        [0  3   2   0   0] (return value)
pflags:         [0  1   0   1   -2] (input)
rflags:         [0  0   2   1    2] (input)
point:          [D  A   C   X    Y]

all the [var] and [var]' components are created internally, only the real
and imaginary component vectors are needed for the values along with the
flags

% INPUTS:       pflags:  component's p axis location
                rflags:  component's r axis location
                C: the DFI

% OUTPUTS:      realvec: vector with the real values of the fourier
                         components
                imagvec: vector with the imaginary values of the fourier
                         components

% DEPENDENCY:   

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function [realvec, imagvec] = invDFI(C, pflags, rflags)

gamma_Paxis_index = pflags + max(pflags) + 1; % convert pflags to matrix index
gamma_Raxis_index = max(rflags) + 1 - rflags; % convert rflags to matrix index

delta_Paxis_index = max(pflags) + 1 - pflags; % convert conjugate values' pflags to matrix index
delta_Raxis_index = max(rflags) + 1 + rflags; % convert conjugate values' rflags to matrix index

realvec = zeros(1,length(pflags)); % create the realvec array to be populated
imagvec = zeros(1,length(pflags)); % create the imagvec array to be populated

for i = 1: length(realvec)
    if(pflags(i) == 0 && rflags(i) == 0)
        % picking out the dc component
        realvec(i) = C(gamma_Raxis_index(i), gamma_Paxis_index(i));
        imagvec(i) = 0;
    else
        % picking out the non dc component
        a = C(gamma_Raxis_index(i), gamma_Paxis_index(i));
        b = C(delta_Raxis_index(i), delta_Paxis_index(i));
        realvec(i) = a + b;
        imagvec(i) = 1j*(a-b);
    end
end

end