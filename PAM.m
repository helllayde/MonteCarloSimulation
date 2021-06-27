%% Pulse Amplitude Modulation
%% Signal formula
% $s_m(t) = A_mg_T(t)$
%%
% or
%%
% $s_m(t) = A_m\sqrt{E_g}\psi(t)$
%% Return value: 
% This function returns the _vector representation_ of the PAM
% constellation.
%%
% $\underline{PAM_M}(E_{av}) = (A_0\sqrt{E_g}, A_1\sqrt{E_g}, ..., A_M\sqrt{E_g})$
%% 
% where
%%
% $A_m = 2m-1-M$ 
%%
% and 
%%
% $E_g = 3\frac{E_av}{M^2-1}$
%% Implementation and example
% The code below represents the implementation of the function, while the
% result is obtained computing:
%%
% $\underline{PAM_5}(10)$
function s = PAM(M, Eav)
    Eg = Eav / (M*M - 1) * 3;
    s = (1 : M);
    
    s = (2*s - 1 - M) * sqrt(Eg);
    s = s';
end


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