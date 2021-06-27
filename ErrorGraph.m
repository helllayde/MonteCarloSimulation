%% Error Graph
%% Summary
% Performs a plot of the comparison between the theoretical error
% probability and the simulated one in AWGN channel. The simulation takes
% the number of points in which you want to calculate the probability, the 
% constellation, the Theoretical Error Function and returns the calculated 
% error probability in that points.
%% Example and implementation
% The code below represents the implementation of the function, while the
% result is obtained computing:
%%
% $ErrorGraph\left(10, I_4, Q\left(\sqrt{\rho_s}\right)\right)$
function sim = ErrorGraph(Npoints, s, ErrorFunction, ConstName)
    if ~exist('ConstName','var')
        ConstName = 'UnknownModulation';
    end
    
    % Get the number of signals in the constellation
    M = size(s, 1);
    
    name = sprintf('%d-%s', M, ConstName);
    fprintf('Performing %s simulation\n\n', name);
    
    % Create the X
    ro = logspace(-2, 6, 2000);
    
    % Calculate the theoretical Y
    Ef = @(rho) subs(ErrorFunction, rho);
    y = eval(Ef(ro));
    
    ro_real = zeros(1, Npoints);
    y_real = zeros(1, Npoints);
    
    mul = logspace(-1, 2, Npoints);
    
    fprintf('Loading ');
    
    % Calculate the actual Y    
    for ii = 1:Npoints
        fprintf(' . ');
        
        s_new = mul(ii) * s;
        ro_real(ii) = sum(sum(s_new.^2,2)) / M;
        N = round(100/eval(Ef(ro_real(ii))));
        
        if N > 1e6
            break
        end
        
        y_real(ii) = MontecarloSimulation(N, s_new);
    end
    fprintf('\n');
    
    % Plotting
    semilogy(10 * log10(ro), y, 'b', 10 * log10(ro_real), y_real, 'r*');
    title(sprintf('ER over SNR plot - theoretical and simulation (%s)', name));
    xlabel('Signal-Noise Ratio in dB');
    ylabel('Logarithmically scaled Error Probability');
    ylim([1e-4, 2]);
    grid on
    
    sim = y_real;
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
