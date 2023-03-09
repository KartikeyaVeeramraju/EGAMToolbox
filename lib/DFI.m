%{
% FUNCTION:     DFI

% DESCRIPTION:   Takes two fourier vectors realvec, imagvec, and constructs
a Discrete Fourier Image (DFI) in two dimensions. It places the frequency
components in places described by the pflags and rflags (which are the axis coordinates)

example axis coordinate map:
----------------------------

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
original vec:   [10 2   3   1.5 2   2.5 0   3   0]
realvec:        [10 2   1.5 2.5 3] (example values)
imagvec:        [0  3   2   0   0] (example values)
pflags:         [0  1   0   1   -2]
rflags:         [0  0   2   1    2]
point:          [D  A   C   X    Y]

all the [var] and [var]' components are created internally, only the real
and imaginary component vectors are needed for the values along with the
flags

% INPUTS:       realvec: vector with the real values of the fourier
                         components
                imagvec: vector with the imaginary values of the fourier
                         components
                pflags:  component's p axis location
                rflags:  component's r axis location

% OUTPUTS:      C: the DFI

% DEPENDENCY:   split_Fourier_vector.m (takes original vec and splits to 
                realvec and imagvec)

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function C = DFI(realvec, imagvec, pflags, rflags)

gamma_Paxis_index = max(pflags) + 1 + pflags; % convert pflags to matrix index
gamma_Raxis_index = max(rflags) + 1 - rflags; % convert rflags to matrix index

delta_Paxis_index = max(pflags) + 1 - pflags; % convert conjugate values' pflags to matrix index
delta_Raxis_index = max(rflags) + 1 + rflags; % convert conjugate values' rflags to matrix index

C = zeros(2*max(rflags) + 1, 2*max(pflags) + 1); % create the DFI matrix to be populated

for i = 1: length(realvec)
    if(pflags(i) == 0 && rflags(i) == 0) % placing dc component
        C(gamma_Raxis_index(i), gamma_Paxis_index(i)) = realvec(i);
    else
        %placing non dc component
        C(gamma_Raxis_index(i), gamma_Paxis_index(i)) = (realvec(i) - 1j*imagvec(i))/2; % placing value
        C(delta_Raxis_index(i), delta_Paxis_index(i)) = (realvec(i) + 1j*imagvec(i))/2; % placing conjugate value
    end
end
end