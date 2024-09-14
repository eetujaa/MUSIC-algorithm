%
% Testaa autokorrelaatiomatriisin koon vaikutusta MUSIC- ja root-MUSIC-menetelmien toimintaan
%
clear;
close all;

%Aikasarjan pituus
N = 1000;
%Autokorrelaatiomatriisin koko
m_vector = 10:1:150;
%Sinusoidien amplitudi
a = 2;
%Signaali-kohinasuhde
SNR = -5;
%Tunnetut oikeat sinusoiditaajuudet
W = [-0.4; -0.25; -0.2; -0.15; 0.1; 0.3; 0.50; 0.8];
%Siunsoidien lukumäärä
n = length(W);
%Monte Carlo -iteraatioiden lukumäärä
monte_carlo_numb = 50;

%Alustus
MSE_spectral = zeros(monte_carlo_numb,length(m_vector));
MSE_root = zeros(monte_carlo_numb,length(m_vector));
err_spectral = zeros(monte_carlo_numb,length(m_vector));
err_root = zeros(monte_carlo_numb,length(m_vector));
times = zeros(monte_carlo_numb,length(m_vector));


for k = 1:monte_carlo_numb
    i = 1;
    
    for m = m_vector
       %Luodaan data
       [y] = create_set_signal(a,n,W,N,SNR);
       
       %Ajanotto
       tic;
       %Lasketaan taajuusarviot
       [w_spectral, w_root] = calc_musics(y,n,m);
       times(k,i) = toc;
       
       %Lasketaan keskineliövirhe MUSIC
       [err_spectral(k,i), MSE_spectral(k,i)] = MSEv5(W, w_spectral);
       
       %Lasketaan keskineliövirhe root-MUSIC
       [err_root(k,i), MSE_root(k,i)] = MSEv5(W,w_root);
       
       i = i + 1;
    end
end

%Monte Carlo -iteraatioiden keskiarvot
MSE_spectral_avg = mean(MSE_spectral,1);
MSE_root_avg = mean(MSE_root,1);
err_spectral_avg = mean(err_spectral, 1);
err_root_avg = mean(err_root, 1);

%MSE(m) kuvaaja
figure(1)
hold on;
plot(m_vector, log10(abs(MSE_spectral_avg)),'r', 'LineWidth',1.5)
plot(m_vector, log10(abs(MSE_root_avg)),'b', 'LineWidth',1.5)
hold off;
%title('Keskineliövirhe parametrin m funktiona');
legend('MUSIC', 'Root-MUSIC', "FontSize", 14)
xlabel('m', "FontSize", 20)
ylabel('MSE', "FontSize", 20)
xlim([10 150])

%Virhekuvaaja
figure(2)
hold on;
plot(m_vector, err_spectral_avg, 'r', 'LineWidth',1.5)
plot(m_vector, err_root_avg, 'b', 'LineWidth',1.5)
hold off;
%title('Virheet')
legend('MUSIC virheet','Root-MUSIC virheet', "FontSize", 14)
xlabel('m', "FontSize", 20)
ylabel('Virheet', "FontSize", 20)
xlim([10 150])

%Keskiarvo laskenta-ajoista
times_avg = mean(times,1);

%Laskenta-aikakuvaaja
figure(3)
plot(m_vector, times_avg, 'LineWidth',1.5)
%title('Algoritmien laskenta-aika')
xlabel("m", "FontSize", 20)
ylabel("Laskenta-aika sekunteissa", "FontSize", 20)
xlim([10 150])



