function [DMASS,THCOND,CPMASS,VISC] = get_lube_oil_properties(T)
% properties of DTE24 vs Temperature

% T      - oil temperature, deg C
% DMASS  - oil density, kg/m3
% THCOND - thermal conductivity, W/(m*K)
% CPMASS - heat capacity, J/kg/K
% VISC   - kinematic viscosity, cSt

path_DTE24 = 'DTE24';
D = load([path_DTE24 filesep 'DTE24.mat'],'DTE24');

% 'kg/m3'
DMASS  = interp1(D.DTE24.T.value, D.DTE24.DMASS.value, T);
% 'W/(m.K)'
THCOND = interp1(D.DTE24.T.value, D.DTE24.THCOND.value, T);
% 'kJ/(kg.K)'
% convert to J/kg*K
CPMASS = 1000*interp1(D.DTE24.T.value, D.DTE24.CPMASS.value, T);
% cSt, kinematic viscosity
VISC   = interp1(D.DTE24.T.value, D.DTE24.VISC.value, T);


end
