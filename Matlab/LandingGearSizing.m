%%Landing Gear Sizing
%Constants:
WTo = 61510; %takeoff weight (lbs)
WR = WTo * 1.01;
WSCLm = 62.3; % W/S * CL_max
CLm = 1.2; % CL_max
TirePress = 60; %Max allowable tire pressure (psi)
LCN = 22; %Load Classification number
mu = 0.3; %friction between tires and runway

%Vertical Loads
WS = WSCLm / CLm; 
Wt = 4.4 * (WS).^(0.25); %Sink speed (ft/s)

NoseLoadingCoeff = 0.08; %percent of weight on nose wheel
Pn = NoseLoadingCoeff * WR; %Normal force on nose wheel
Pm = (WR - Pn)/2;

%using type 7 tires
fdyn = 1.5; % tire factor
Pndyn = fdyn * Pn; %nose wheel dynamic load


%tire pressure
%nose gear
%assuming size = 18 x 4.4, from The_layout_of_tricycle_landing_gear.pdf
Dn = 17.9; Wn = 4.45; Rrn = 7.9;
Apn = (2.3.*sqrt(Dn.*Wn).*(Dn./2 - Rrn));
NoseInflPress = Pn./Apn;

%main gear
%assuming size = 40 x 14, from The_layout_of_tricycle_landing_gear.pdf
Dm = 39.8; Wm = 14; Rrm = 16.5;
Apm = (2.3.*sqrt(Dm.*Wm).*(Dm./2 - Rrm));
MainInflPress = Pm./Apm;

%Longitudinal force (Braking force + acceleration force) 
%assuming friction coeff mu = 0.3 (typical for hard runways)
FmBraking = Pm *mu;
FnBraking = Pn *mu;


%%turnover angle (ignore)
hcg = 9; %height of cg (ft)
ln = 27.3; %distance from nose gear to cg
lm = 2.7; %distance from main gear to cg
%



