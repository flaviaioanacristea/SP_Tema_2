syms t; % valoare simbolica
T = 40; %perioada data de cerinta
w0 = 2*pi/T; %pulsatia

f = heaviside(t) - heaviside(t - 9); % folosesc functia heaviside pt a crea semnalul
%din cerinta rezulta ca semnalul meu va avea durata de 9s
N = 50; %numarul de coeficienti

[a0, a, b] = TEMA_2_FUNCTIE_CRISTEA_FLAVIA_424C(f, T, N);

val_t = [-50:0.02:50];
sf = a0; % armonica fundamentala
tso = [-50:0.02:50];
freq = 0.025;
square_wave = 0.5 + 0.5 * square(2*pi*freq.*tso, 22.5);

subplot(3, 1, 1)
plot(tso, square_wave)  % afisez semnalul dreptunghiular, original
title('Semnal dreptunghiular')

for n = 1:N
    arm = a(n)*cos(n*w0*val_t) + b(n)*sin(n*w0*val_t); %calculez fiecare armonica
    sf = sf + arm; % adaug fiecare armonica la cea fundamentala, pentru a construi SF
    subplot(3, 1, 2)
    plot(tso, square_wave) %afisez semnalul dreptunghiular peste care voi suprapune semnalul reconstruit
    title('x(t) (albastru) si reconstructia folosind N coeficienti (rosu)')
    hold on     % suprapun semnalul reconstruit cu ajutorul perechii hold on hold off
    plot(val_t, sf, 'red')
    hold off
end


for n = 1:N
    An(n) = sqrt(a(n)^2+b(n)^2); %aici calculez valorile amplitudinii pe fiecare armonica 
end

x = [fliplr(An) a0 An]; % aici oglindesc elementele vectorului An pt a obtine o imagine simetrica
k = -N:1:N;
subplot(3, 1, 3) %afisez spectrul de amplitudini
stem(k, x) % pun stem pentru a avea un grafic cu bare
hold on
plot(k, x)
hold off % am folosit hold on si off pentru a putea afisa toate elementele spectrului, in acelasi timp
title('Spectrul de amplitudini')
% Asa cum am invatat la cursul de Semnale si Sisteme, spectrul amplitudinii 
% arata o armonica fundamentala(componenta continua) mai mica decat prima armonica.
% spectrul scade in valori pe masura ce ordinul armonicelor creste, avand
% nule componentele de forma: durata semnalului*n, unde n apartine
% lui natural.
