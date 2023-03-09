%{
% FUNCTION:     merge_fourier_vector

% DESCRIPTION:  Takes the split rectangular fourier vectors and merges them into one vector 

% INPUTS:       realvec: all the real components of input vector v
                imagvec: all the imaginary components of input vector v
     
% OUTPUTS:     v: rectangular coordinate fourier vector

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}
function v = merge_fourier_vector(realvec,imagvec)
    
    v = zeros(1,2*length(realvec)-1);
    v(1) = realvec(1);
    for i = 1:length(realvec)-1
      v(2*i:2*i+1) = [realvec(i+1) imagvec(i+1)];
    end
end