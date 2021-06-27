%% Pulse Position Modulation
%% Signal formula
% $s_m(t) = \frac{\sqrt{\epsilon_s}}{\sqrt{\epsilon_g}} g_{\frac{T}{M}}\left(t-\frac{mT}{M}\right)$
%% Return value
% This function returns the _vector representation_ of the PPM
% constellation.
% $\underline{\underline{PPM_M}}(\epsilon_s) = \pmatrix{
% \sqrt{\epsilon_s} & 0 & ... & 0\cr
% 0 & \sqrt{\epsilon_s} & ... & 0\cr
% ... & ... & ... & ...\cr
% 0 & 0 & ... & \sqrt{\epsilon_s}\cr
% }$
%% Implementation and example
% The code below represents the implementation of the function, while the
% result is obtained computing:
%%
% $\underline{\underline{PPM_4}}(5)$
function s = PPM(N, Es)
    s = sqrt(Es) * eye(N, N);
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