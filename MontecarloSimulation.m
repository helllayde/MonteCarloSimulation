%% Monte Carlo Simulation
%% Summary
% This function performs a series of $N$ Monte Carlo Simulation in order to
% estimate the Error Rate of the signals constellation. This is performed
% during an empirical proof adding a random gaussian noise. This test is
% designed to evaluate the BER in the AWGN channel
%% Mehodology
% A random message of $N$ symbols is generated and encoded using the 
% constellation $s$. During the test it is assumed to ha e a noise with
% average power $N_0 = 1$, so the noise can be modeled as:
%%
% $n \sim \mathcal{N}(0, \frac{\sqrt{2}}{2})$
%%
% The noise is added to the encoded message and then it is decoded using
% the minimum distance method. Let $\hat{m}$ be the estimated sent symbol 
% and $\underline{r}$ the recieved one:
%%
% $\hat{m} = argmin_M\mid\mid \underline{r} - \underline{s_m}\mid\mid^2$
%% Implementation and Example
% The code below represents the implementation of the function, while the
% result is obtained computing:
%%
% $MontecarloSimulation(100, [-1, 0, 1])$
function ErrorRate = MontecarloSimulation(N, s)
    
    % Get the constellation properties
    M = size(s, 1);
    Dim = size(s, 2);
    
    % Generate noise and random message
    n = sqrt(1/2) * randn(N, Dim);
    msg = randi(M, 1, N);
    
    % Encode the message
    cod_msg = s(msg,:); 
    
    % Additive White Gaussian Noise (AWGN)
    r = cod_msg + n;
    
    % Decode the recieved message
    errors = 0;
    for ii = 1:N
        
        % Which is the less distant symbol?
        idx_min = 1;
        dist2_min = sum((r(ii,:) - s(1,:)).^2);
        
        for jj = 2:M
            dist2 = sum((r(ii,:) - s(jj,:)).^2);
            if(dist2 < dist2_min)
                dist2_min = dist2;
                idx_min = jj;
            end
        end
        
        % Are we wrong?
        if idx_min ~= msg(ii)
            errors = errors + 1;
        end
    end
    
    % Estimate Error Rate
    ErrorRate = errors/N;
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