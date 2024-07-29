%Para polarizaci�n lineal la diferencia de fase debe ser de 0� o 180�, la amplitud puede ser diferente
%Para polarizaci�n circular la diferencia de fase debe ser de 90� o 270�, la amplitud debe ser la misma 
%Cualquier otra combinaci�n nos da polarizaci�n el�ptica 

%Vector de tiempo
t = 0:0.01:pi; 

%Frecuencia en Hz, la frecuencia debe ser la misma para ambas se�ales
f = 1;

%Amplitudes y fases (en radianes) de cada se�al senoidal
Ax = 1;
Ay = 1;
PhaseX = 0;
PhaseY = -pi/2;

%Se�ales senoidales
Ex = Ax*sin(2*pi*f*t + PhaseX);
Ey = Ay*sin(2*pi*f*t + PhaseY);

%C�digo para visualizar la gr�fica en 3D, el t�tulo de la gr�fica se decide de forma autom�tica 
%dependiendo de la amplitud y la fase de cada se�al
h = animatedline;
view(3);
if abs(PhaseX-PhaseY) == 0 | abs(PhaseX-PhaseY) == pi
    set(gcf, 'Position', get(0, 'Screensize')); grid on; title ('Polarizaci�n lineal') 
elseif abs(PhaseX-PhaseY) == pi/2 & Ax == Ay
    set(gcf, 'Position', get(0, 'Screensize')); grid on; title ('Polarizaci�n circular')    
else
    set(gcf, 'Position', get(0, 'Screensize')); grid on; title ('Polarizaci�n el�ptica')
end
axis('equal');

%C�digo para graficar durante la ejecuci�n
for k = 1:length(Ex)
    addpoints(h,t(k),Ex(k),Ey(k));
    drawnow
end