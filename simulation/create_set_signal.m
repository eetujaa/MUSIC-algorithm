% Funktio muodostaa aikasarjan sinusoideista ja valkoisesta kohinasta
%
% Parametrit
% Sisään
%   a, sinusoidien amplitudi
%   n, sinusoidien lukumäärä
%   W, sinusoidien taajuudet
%   N, aikasarjan y pituus
%   SNR, signaali-kohinasuhde desibeleinä
% Ulos
%   y, aikasarja
function [y] = create_set_signal(a,n,W,N,SNR)
    t = 1:N;
    y = zeros(1,N);
   
   %sinusoidiosan lisääminen
    for k = 1:n
        phi = -pi+(2*pi)*rand(1,1);
        w = W(k);
        sinusoid = a*exp(1i*(w*pi*t+phi));
        y = y + sinusoid;
    end
    
    %kohinan lisääminen signaalitehon ja SNR:n avulla
    SNR_linear = 10^(SNR/10);
    noise_power = abs(a)^2 / SNR_linear;
    noise = sqrt(noise_power/2) * (complex(randn(size(t)), randn(size(t))));
    y = y + noise;
end
