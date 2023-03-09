%{
% FUNCTION:     conv2DDFI

% DESCRIPTION:  EGAM core DFI convolution algorithm.
                performs six steps:
                1. splits two fourier vectors to cos and sin separated
                      vectors
                2. computes the DFI equivalent representations of the split
                      vectors using the provided pflags and rflags
                3. 2D convolves the two DFIs
                4. matches the harmonics and creates a matched DFI
                5. computes the inverse DFI of the matched DFI and creates
                      a matched vector
                6. merges the cos and sin separated matched vector and
                      returns the resulting vector
     
% INPUTS:       v1: fourier vector operator 1
                v2: fourier vector operator 2
                pflags:  component's p axis location
                rflags:  component's r axis location
               

% OUTPUT:     vout: 2D convolved vector  

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function vout = conv2DDFI(v1, v2, pflags, rflags)
[a1,b1] = split_Fourier_vector(v1);
[a2,b2] = split_Fourier_vector(v2);
C1 = DFI(a1,b1,pflags,rflags);
C2 = DFI(a2,b2,pflags,rflags);
C3 = conv2(C1,C2);
C4 = match_harmonics(C3,C1);
[vor, voi] = invDFI(C4, pflags, rflags);
vout = merge_fourier_vector(vor, voi);
end