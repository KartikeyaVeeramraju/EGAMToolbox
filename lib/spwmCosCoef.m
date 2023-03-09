%{
% FUNCTION:     spwmCosCoef

% DESCRIPTION:  returns the cos term coefficient of the Fourier expansion 
                of SPWM waveform

% INPUTS:       n: carrier frequency harmonic number (must be an integer)
                i: modulation frequency harmonic number (must be an integer)
                m10c: grid fundamental modulation index value for the cos
                    term coefficient
                m10s: grid fundamental modulation index value for the sin
                    term coefficient    
                phi_hat: Carrier signal's phase
                phi_bar: Modulation signal's phase

% OUTPUT:     value: SPWM coefficient for the requested harmonic orders 

% ERRORS:       

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function value = spwmCosCoef(n,i,m10c, m10s, phi_hat, phi_bar)
yn = n*(pi/2)*sqrt(m10c^2 + m10s^2);
value = (2/(n*pi))*sin(pi*(n+i)/2)*besselj(i,yn)*cos(n*phi_hat + i*phi_bar);
end