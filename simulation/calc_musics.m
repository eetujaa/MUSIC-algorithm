% Funktio laskee MUSIC- ja root-MUSIC menetelmillä sinusoiditaajuusarviot 
% annetusta aikasarjasta y
% Parametrit
% Sisään
%   y, aikasarja
%   n, sinusoidien lukumäärä
%   m, autokorrelaatiomatriisin koko
% Ulos
%   w_spectral, tavallisella MUSIC-menetelmällä lasketut taajuusarviot
%   w_root, root-MUSIC-menetelmällä lasketut taajuusarviot
function [w_spectral, w_root] = calc_musics(y,n,m)
    %autokorrelaatio    
    [~,R] = corrmtx(y,m);
    
    %MUSIC-pseudospektri
    [P, w_spectral_vals] = pmusic(R,n,'corr',2^16,'centered');
    w_spectral_vals = w_spectral_vals/pi;
    
    %MUSIC-sinusoiditaajuudet
    [~,idx] = findpeaks(20*log10(abs(P)),'MinPeakProminence',5);
    w_spectral = w_spectral_vals(idx);
    
    %Root-MUSIC-sinusoiditaajuudet
    [w_root,~] = rootmusic(R,n,'corr');
    w_root = w_root/pi;
end