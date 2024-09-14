% Funktio laskee MUSIC- ja root-MUSIC menetelmillä sinusoiditaajuusarviot 
% annetusta aikasarjasta y sekä laskemiseen kuluneet ajat
% Parametrit
% Sisään
%   y, aikasarja
%   n, sinusoidien lukumäärä
%   m, autokorrelaatiomatriisin koko
%   nfft, MUSIC-pseudospektrin taajuusakselin tiheys
% Ulos
%   w_spectral, tavallisella MUSIC-menetelmällä lasketut taajuusarviot
%   w_root, root-MUSIC-menetelmällä lasketut taajuusarviot
%   spectral_time, MUSIC-pseudospektrin laskemiseen kulunut aika
%   root_time, root-MUSIC-taajuusarvioiden laskemiseen kulunut aika
function [w_spectral, w_root, spectral_time, root_time] = calc_musicsv2(y,n,m,nfft)
    %autokorrelaatio    
    [~,R] = corrmtx(y,m);
    
    %MUSIC-pseudospektri
    tic;
    [P, w_spectral_vals] = pmusic(R,n,'corr',nfft,'centered');
    spectral_time = toc;
    w_spectral_vals = w_spectral_vals/pi;
    
    %MUSIC-sinusoiditaajuudet
    [~,idx] = findpeaks(20*log10(abs(P)),'MinPeakProminence',5);
    w_spectral = w_spectral_vals(idx);
    
    %Root-MUSIC-sinusoiditaajuudet
    tic;
    [w_root,~] = rootmusic(R,n,'corr');
    root_time = toc;
    w_root = w_root/pi;
end