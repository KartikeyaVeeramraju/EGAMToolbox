%{
% FUNCTION:    build_signal_from_fourier_vector_train

% DESCRIPTION:  This function takes a Fourier Vector train (v), the pflag 
                and rflag variables, the frequencies associated to each 
                harmonic axis of the DFI and a time vector (t) and finally
                computes an output vector (out) 

% INPUTS:       v     :  Fourier vector train  
                pflags:  component's p axis location
                rflags:  component's r axis location
                w1    :  p-axis angular frequency in radians/sec
                w2    :  r-axis angular frequency in radians/sec
                t     :  time vector for unrolling

% OUTPUTS:      out: the vector of same length as t, containing the values
                     of the signal

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}
function out = build_signal_from_fourier_vector_train(v,pflags,rflags,w1,w2,t)

out = zeros(1,length(t)); %declare signal length
harmonic_count = length(pflags); %assuming length(j_axis_flags) == length(k_axis_flags)

%first populate the time instances
C_t = zeros(1,2*harmonic_count-1);


for i = 1:length(t) % time base index

    %% build time vector
    k = 1; % cos and sine value placement index
    for m = 1:harmonic_count
        C_t(k) = cos(pflags(m)*w1*t(i) + rflags(m)*w2*t(i));
        
        % only place sin terms when we are not placing the dc terms;
        % this would mean that the dc term only gets the cos term
        if k ~= 1
            k = k+1; % go to next array position
            C_t(k) = sin(pflags(m)*w1*t(i) + rflags(m)*w2*t(i));
        end
        k = k+1; % go to next array position
    end

    out(i) = C_t * v(i,:)';

end

end
