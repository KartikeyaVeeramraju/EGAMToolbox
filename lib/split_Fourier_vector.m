%{
% FUNCTION:     split_Fourier_vector

% DESCRIPTION:  Takes a rectangular coordinate fourier vector and splits
                the real and imaginary parts to two vectors that are returned.

% INPUTS:       v: rectangular coordinate fourier vector
     
% OUTPUTS:      realvec: all the real components of input vector v
                imagvec: all the imaginary components of input vector v

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function [realvec, imagvec] = split_Fourier_vector(v)

harmonic_count = ((length(v)-1)/2)+1;

% just a verification that v is of appropriate length
if length(v) == 2*harmonic_count - 1
    realvec = zeros(ceil(length(v)/2),1); % the x axis components go here
    imagvec = zeros(ceil(length(v)/2),1); % the y axis compoenents go here
   
    realvec(1) = v(1);  % first position of v goes directly to realvec
    
    imagvec(1) = 0;     % first position of imagvec is a zero
    realvec(2:end) = v(2:2:end);
    imagvec(2:end) = v(3:2:end);
else
    fprintf("Error: in split_Fourier_vector.m: length of v cannot be split into the requested number of harmonics!\n")
end
end