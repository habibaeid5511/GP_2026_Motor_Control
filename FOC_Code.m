%% Our Motor Parameters

R = 2.9;              % ohm

Lq = 5.75e-3;         % H

Ld = 5.75e-3;         % H

lambda = 0.0884669;      % V.S

p = 3;                 % pole pairs

power = 400;        % W

n = 3000;              % rpm

Vdc = 311;             % V

Idc = 10;              % A

B = 0.0314;  %Nm.s/rad

J = 0.001854; % kg.m^2

%% Open_Loop_system

Fs=10e3;
Ts=1/Fs;
fo=50;
MI=0.9;

%% FOC Control

fs = 10e3;     
T_period = 1/fs;

ma = 0.95;   
%{
 ma < 1 not to exceed the min time for proper bootstrap
 gate driving (time to charge and discharge the capacitor) 
%} 

T_max = 3.81;    % for max iq 

zeta = 0.9;
gama = 0.92;

%% d-Currrent Controller

b_d = 1 / Ld;
a_d = R / Ld;   % open loop BW

wn_d = a_d / (1-gama);

Kp_d = (2*zeta*wn_d - a_d) / b_d;
Ki_d = (wn_d^2) / b_d;

%% q-Currrent Controller

b_q = 1 / Lq;
a_q = R / Lq;

wn_q = a_d / (1-gama);

Kp_q = (2*zeta*wn_q - a_q) / b_q;
Ki_q =(wn_q^2) / b_q;



%% Speed Controller

b_s = (3/2) * (p*lambda/J);
a_s = B / J;

wn_s = wn_q / 10;

Kp_s = (2*zeta*wn_s - a_s) / b_s;
Ki_s = (wn_s^2) / b_s;