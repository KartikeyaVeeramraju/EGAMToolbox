%{
% FUNCTION:     getSPWMcoeff

% DESCRIPTION:  creates a vector q and populates it with the Fourier coefficients of
                cos and sin terms of Sine Pulse Width Modulatation (SPWM) waveform
                in the order given by the pflags and rflags
     
% INPUTS:       pflags:  component's p axis location
                rflags:  component's r axis location
                w1: pflags' frequency in rad/sec
                w2: qflags' frequency in rad/sec
                m10c: grid fundamental modulation index value for the cos
                    term coefficient
                m10s: grid fundamental modulation index value for the sin
                    term coefficient    
                phi_hat: Carrier signal's phase
                phi_bar: Modulation signal's phase

% OUTPUTS:     q: SPWM coefficient vector 

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}
function q = getSPWMcoeff(pflags, rflags, m10c, m10s, phi_hat, phi_bar)

%initialize the vector
q = zeros(2*length(pflags)-1,1);


k = 1; % k is the array assignment index control variable
for i = 1:length(pflags) % i is the flag index control variable

    if pflags(i) == 1 && rflags(i) == 0
        % for modulation component's fundamental
        qc = 0.5*m10c;
        qs = 0.5*m10s;
    elseif pflags(i) > 1 && rflags(i) == 0
        % for modulation component's second harmonic
        qc = 0;
        qs = 0;
    else
        % for switching and sideband components
        qc = spwmCosCoef(rflags(i),pflags(i),m10c, m10s, phi_hat, phi_bar); %cos term
        qs = spwmSinCoef(rflags(i),pflags(i),m10c, m10s, phi_hat, phi_bar); %sin term
    end
    if k == 1
        q(k) = 0.5; % assign a 0.5 if k = 1
        k = k + 1;
    else
        q(k) = qc; % cos term assignment
        k = k+1;
        q(k) = qs; % sin term assignment
        k = k+1;
    end

end

end