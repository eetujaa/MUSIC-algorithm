%
% Piirtää MUSIC-pseudospektrikuvaajia eri SNR- ja m-arvoilla
%
clear;
close all;

%Aikasarjan pituus
N = 1000;
%Sinusoidien amplitudi
a = 2;
%Autokorrelaatiomatriisin koko
m = 50;
%Signaali-kohinasuhde
SNR = 0;
%Tunnetut oikeat sinusoiditaajuudet
W = [-0.4; -0.25; -0.2; -0.15; 0.1; 0.3; 0.45; 0.47; 0.50; 0.8];
%Siunsoidien lukumäärä
n = length(W);
%Taajuusakselin tiheys
nfft = 2^16;

figure(1)
hold on;
[y] = create_set_signal(a,n,W,N,-20);
[~,R] = corrmtx(y,m);
[P, w] = pmusic(R,n,'corr',nfft,'centered');
w = w/pi;
plot(w,20*log10(abs(P)), 'LineWidth',1.5)
for i = 1:length(W)
    line([W(i), W(i)], ylim, 'Color', 'r', 'LineStyle', '--');
end
hold off;
grid on
legend("MUSIC-pseudospektri","Oikeat taajuudet", "FontSize", 14)
xlabel("Taajuus", "FontSize", 20)
ylabel("Teho", "FontSize", 20)
%title("MUSIC-pseudospektri, m=50, SNR=-20", "FontSize", 20)

figure(2)
hold on;
[y] = create_set_signal(a,n,W,N,-15);
[~,R] = corrmtx(y,m);
[P, w] = pmusic(R,n,'corr',nfft,'centered');
w = w/pi;
plot(w,20*log10(abs(P)), 'LineWidth',1.5)
for i = 1:length(W)
    line([W(i), W(i)], ylim, 'Color', 'r', 'LineStyle', '--');
end
hold off;
grid on
legend("MUSIC-pseudospektri","Oikeat taajuudet", "FontSize", 14)
xlabel("Taajuus", "FontSize", 20)
ylabel("Teho", "FontSize", 20)
%title("MUSIC-pseudospektri, m=50, SNR=-15", "FontSize", 14)


figure(3)
hold on;
[y] = create_set_signal(a,n,W,N,10);
[~,R] = corrmtx(y,m);
[P, w] = pmusic(R,n,'corr',nfft,'centered');
w = w/pi;
plot(w,20*log10(abs(P)), 'LineWidth',1.5)
for i = 1:length(W)
    line([W(i), W(i)], ylim, 'Color', 'r', 'LineStyle', '--');
end
hold off;
grid on
legend("MUSIC-pseudospektri","Oikeat taajuudet", "FontSize", 14)
xlabel("Taajuus", "FontSize", 20)
ylabel("Teho", "FontSize", 20)
%title("MUSIC-pseudospektri, m=50, SNR=10", "FontSize", 14)



figure(4)
hold on;
[y] = create_set_signal(a,n,W,N,SNR);
[~,R] = corrmtx(y,15);
[P, w] = pmusic(R,n,'corr',nfft,'centered');
w = w/pi;
plot(w,20*log10(abs(P)), 'LineWidth',1.5)
for i = 1:length(W)
    line([W(i), W(i)], ylim, 'Color', 'r', 'LineStyle', '--');
end
hold off;
grid on
legend("MUSIC-pseudospektri","Oikeat taajuudet", "FontSize", 14)
xlabel("Taajuus", "FontSize", 20)
ylabel("Teho", "FontSize", 20)
%title("MUSIC-pseudospektri, m=15, SNR=0", "FontSize", 14)


figure(5)
hold on;
[y] = create_set_signal(a,n,W,N,SNR);
[~,R] = corrmtx(y,30);
[P, w] = pmusic(R,n,'corr',nfft,'centered');
w = w/pi;
plot(w,20*log10(abs(P)), 'LineWidth',1.5)
for i = 1:length(W)
    line([W(i), W(i)], ylim, 'Color', 'r', 'LineStyle', '--');
end
hold off;
grid on
legend("MUSIC-pseudospektri","Oikeat taajuudet", "FontSize", 14)
xlabel("Taajuus", "FontSize", 20)
ylabel("Teho", "FontSize", 20)
%title("MUSIC-pseudospektri, m=30, SNR=0", "FontSize", 14)


figure(6)
hold on;
[y] = create_set_signal(a,n,W,N,SNR);
[~,R] = corrmtx(y,45);
[P, w] = pmusic(R,n,'corr',nfft,'centered');
w = w/pi;
plot(w,20*log10(abs(P)), 'LineWidth',1.5)
for i = 1:length(W)
    line([W(i), W(i)], ylim, 'Color', 'r', 'LineStyle', '--');
end
hold off;
grid on
legend("MUSIC-pseudospektri","Oikeat taajuudet", "FontSize", 14)
xlabel("Taajuus", "FontSize", 20)
ylabel("Teho", "FontSize", 20)
%title("MUSIC-pseudospektri, m=45, SNR=0", "FontSize", 14)

