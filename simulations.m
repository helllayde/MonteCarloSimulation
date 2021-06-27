%% Summary
% This script is used to perform all the simulations for the constellations
close all
clear clc

syms ro

%% PAM
% $P_e^{PAM} = \frac{2(M-1)}{M}Q\left(\frac{\sqrt{6\rho_s}}{M^2-1}\right)$
M_PAM = 4;
Ef_PAM = ((2 * (M_PAM - 1)) / M_PAM) * (1 - normcdf(sqrt(6 * ro / (M_PAM ^ 2 - 1)), 0, 1));

%% PPM
% $P_e^{PPM} = (M - 1)Q\left(\sqrt{\rho_s}\right)$
M_PPM = 8;
Ef_PPM = (M_PPM - 1) * (1 - normcdf(sqrt(ro), 0, 1));

%% PSK
% $P_e^{PSK} = 2Q\left(\sqrt{ 2 \rho_s \sin^2\left(\frac{\pi}{M}\right) }\right)$ 
M_PSK = 4;
Ef_PSK = 2 * (1 - normcdf(sqrt(2 * ro * sin(pi/M_PSK)^2), 0, 1));

%% QAM
% $P_e^{QAM} = \frac{4(\sqrt{M} - 1)}{\sqrt{M}}Q\left(\frac{3\rho_s}{M -
% 1}\right) - \frac{4(\sqrt{M} - 1)^2}{M}Q^2\left(\frac{3\rho_s}{M -
% 1}\right)$
M_QAM = 16;
m_QAM = sqrt(M_QAM);
Ef_QAM_PAM = ((2 * (m_QAM - 1)) / m_QAM) * (1 - normcdf(sqrt(3 * ro / (M_QAM - 1)), 0, 1));
Ef_QAM = 2 * Ef_QAM_PAM - Ef_QAM_PAM.^2;

%% Simulations
NSim = 20;

ErrorGraph(NSim, PAM(M_PAM, 1), Ef_PAM, 'PAM');
figure

ErrorGraph(NSim, PPM(M_PPM, 1), Ef_PPM, 'PPM');
figure

ErrorGraph(NSim, PSK(M_PSK, 1), Ef_PSK, 'PSK');
figure

ErrorGraph(NSim, QAM(M_QAM, 1, 1), Ef_QAM, 'QAM');

%% License
% Copyright (C) 2019 helllayde
%%
% Redistribution and use in source and binary forms, with or without 
% modification, are permitted provided that the following conditions are 
% met:
%%
% 1. Redistributions of source code must retain the above copyright notice, 
% this list of conditions and the following disclaimer.
%%
% 2. Redistributions in binary form must reproduce the above copyright 
% notice, this list of conditions and the following disclaimer in the 
% documentation and/or other materials provided with the distribution.
%%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
% TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
% PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
% CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
% PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
