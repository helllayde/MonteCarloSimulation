
%% Quadrature Amplitude Modulation
%% Signal formula
% $s_m(t) = \sqrt{\frac{2}{T}}g_T(t)\left[A_{mc}\cos\left(2\pi
% f_ct\right)+A_{ms}\sin\left(2\pi f_ct\right)\right]$
%% Return value
% This function returns the _vector representation_ of the QAM
% constellation
%%
% $\underline{\underline{QAM_M}}(E_c, E_s) = \underline{PAM_{\sqrt{M}}}(E_c) \times \underline{PAM_{\sqrt{M}}}(E_s)$
%% Implementation and example
% The code below represents the implementation of the function, while the
% result is obtained computing:
%%
% $\underline{\underline{QAM_{16}}}(10, 10)$
function s = QAM(M, Ec, Es)
    m = sqrt(M);
    [X, Y] = meshgrid(PAM(m, Ec), PAM(m, Es));
    s = [X(:) Y(:)];
end

%% License
% Copyright (C) helllayde
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