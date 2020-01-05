function [a0, a, b] = TEMA_2_FUNCTIE_CRISTEA_FLAVIA_424C(f, T, N)

syms t;
T = 40;
w0 = 2*pi/T;

f = heaviside(t) - heaviside(t - 9);

a0_sym = 1/T*int(f, t, 0, T); %calculul fundamentalei
a0 = double(a0_sym);

for n = 1:N;
    a_sym(n) = 2/T*int(f*cos(n*w0*t), t, 0, T);
    b_sym(n) = 2/T*int(f*sin(n*w0*t), t, 0, T); % calculul coeficientilor pt fiecare armonica
    
    a(n) = double(a_sym(n));
    b(n) = double(b_sym(n));
    
end

end