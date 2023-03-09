% this is the function used by the ode solver to run the EGAM simulation
function dxdt = Inverter_model(t,x,q1, q2,T, pflags, rflags, params)

%% retrive the excitation voltage, inductor and capacitor values
L1 = params.L1;
L2 = params.L2;
C1 = params.C1;
C2 = params.C2;

Vdc = params.Vdc; % get the dc voltage excitation


%% run conditionals for startup, load and modulation step decisions

% load step decisions
if t > params.steptime
    Rload = params.RL2;
else
    Rload = params.RL1;
end

% modulation step decisions
if t > params.modsteptime
    q = q2;
else
    q = q1;
end

% some helper variables
eye_dim = (2*max(pflags) + 1) * (2*max(rflags) + 1);
vec_segment = (2*max(pflags) + 1) * (2*max(rflags) + 1);
gammadc = [1 zeros(1,eye_dim-1)]';
gammaac = [1 zeros(1,eye_dim-1)]';

% startup step decisions
if t < params.starttime
    q = 0*q; % no switching
    gammaac = 0*[1 zeros(1,eye_dim-1)]'; %
end

if t < 0.5*params.starttime
RindDC = 10*params.RIndDCSide;
RindAC = 10*params.RIndACSide;
else
    RindDC = params.RIndDCSide;
    RindAC = params.RIndACSide;
end


%% unstacking composite Fourier state vector to reassign to indiviual Fourier state vectors
IL1 = x(1:vec_segment);
VC1 = x(vec_segment+1:2*vec_segment);
IL2 = x(2*vec_segment+1:3*vec_segment);
VC2 = x(3*vec_segment+1:4*vec_segment);

%% running the differential equations
% notice when two fourier vectors are multiplying, we use the core 2D
% convolution algorithm

%input filter inductor equation
dIL1_dt = -1*(T + RindDC/L1)*IL1 - VC1/L1 + Vdc/L1*gammadc;

%input dc link capacitor equation
dVC1_dt = IL1/C1 - (2/C1)*conv2DDFI(IL2',q',pflags,rflags)' + (1/C1)*conv2DDFI(gammadc',IL2',pflags,rflags)' - T*VC1; 

%output filter inductor equation
dIL2_dt = (2/L2)*conv2DDFI(q',VC1',pflags,rflags)' - (1/L2)*conv2DDFI(gammaac',VC1',pflags,rflags)' - ((1/L2)*RindAC + T)*IL2 - VC2/L2; 

%output filter capacitor equation
dVC2_dt = (1/C2)*IL2 - (T + (1/(Rload*C2)*eye(eye_dim)))*VC2;

%% stack vectors and handover to ode process call

dxdt = [dIL1_dt; dVC1_dt; dIL2_dt; dVC2_dt];
end
