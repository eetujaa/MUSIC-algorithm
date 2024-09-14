%
% Testaa sinusoidien määrän vaikutusta MUSIC- ja root-MUSIC-menetelmien toimintaan
%
clear;
close all;

%Aikasarjan pituus
N = 1000;
%Autokorrelaatiomatriisin koko
%m=25
m = 79;
%Sinusoidien amplitudi
a = 2;
%Signaali-kohinasuhde
SNR = -5;
%Tunnetut oikeat sinusoiditaajuudet
W = -0.95:0.05:0.95;
W = W';
%W = [0; -0.1; 0.1; -0.2; 0.2;
%    -0.3; 0.3; -0.4; 0.4; -0.5;
%    0.5; -0.15; 0.13; -0.18; 0.23;
%    -0.24; 0.28; -0.29; 0.32; -0.32];
%Siunsoidien lukumäärä
n = 1:length(W);
%Monte Carlo -iteraatioiden lukumäärä
monte_carlo_numb = 50;

%Alustus
MSE_spectral = zeros(monte_carlo_numb,length(n));
MSE_root = zeros(monte_carlo_numb,length(n));
err_spectral = zeros(monte_carlo_numb,length(n));
err_root = zeros(monte_carlo_numb,length(n));


for k = 1:monte_carlo_numb
    i = 1;
    for n_i = n
        %Taajuusvektorin iterointi
        W_i = W(1:n_i);
       
        %Luodaan data
        [y] = create_set_signal(a,n_i,W_i,N,SNR);

        %Lasketaan taajuusarviot
        [w_spectral, w_root] = calc_musics(y,n_i,m);

        %Lasketaan keskineliövirhe MUSIC
        [err_spectral(k,i), MSE_spectral(k,i)] = MSEv5(W_i, w_spectral);

        %Lasketaan keskineliövirhe root-MUSIC
        [err_root(k,i), MSE_root(k,i)] = MSEv5(W_i,w_root);
       
        i = i + 1;
    end
end

%Monte Carlo -iteraatioiden keskiarvot
MSE_spectral_avg = mean(MSE_spectral,1);
MSE_root_avg = mean(MSE_root,1);
err_spectral_avg = mean(err_spectral, 1);
err_root_avg = mean(err_root, 1);

%MSE(n) kuvaaja
figure(1)
hold on;
plot(n, log10(abs(MSE_spectral_avg)),'r', 'LineWidth',1.5)
plot(n, log10(abs(MSE_root_avg)),'b', 'LineWidth',1.5)
hold off;
%title('Keskineliövirhe sinusoidien määrän funktiona');
legend('MUSIC', 'Root-MUSIC', "FontSize", 14)
xlabel('Sinusoidien määrä', "FontSize", 20)
ylabel('MSE', "FontSize", 20)
xlim([1 length(n)])

%Virhekuvaaja
figure(2)
hold on;
plot(n, err_spectral_avg, 'r', 'LineWidth',1.5)
plot(n, err_root_avg, 'b', 'LineWidth',1.5)
hold off;
%title('Virheet')
legend('MUSIC virheet','Root-MUSIC virheet', "FontSize", 14)
xlabel('Sinusoidien määrä', "FontSize", 20)
ylabel('Virheet', "FontSize", 20)
xlim([1 length(n)])

