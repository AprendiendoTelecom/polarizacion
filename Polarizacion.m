%Para polarización lineal la diferencia de fase debe ser de 0° o 180°, la amplitud puede ser diferente
%Para polarización circular la diferencia de fase debe ser de 90° o 270°, la amplitud debe ser la misma 
%Cualquier otra combinación nos da polarización elíptica 

%Vector de tiempo
t = 0:0.01:pi; 

%Frecuencia en Hz, la frecuencia debe ser la misma para ambas señales
f = 1;

%Amplitudes y fases (en radianes) de cada señal senoidal
Ax = 1;
Ay = 1;
PhaseX = 0;
PhaseY = -pi/2;

%Señales senoidales
Ex = Ax*sin(2*pi*f*t + PhaseX);
Ey = Ay*sin(2*pi*f*t + PhaseY);

%Código para visualizar la gráfica en 3D, el título de la gráfica se decide de forma automática 
%dependiendo de la amplitud y la fase de cada señal
h = animatedline;
view(3);
if abs(PhaseX-PhaseY) == 0 | abs(PhaseX-PhaseY) == pi
    set(gcf, 'Position', get(0, 'Screensize')); grid on; title ('Polarización lineal') 
elseif abs(PhaseX-PhaseY) == pi/2 & Ax == Ay
    set(gcf, 'Position', get(0, 'Screensize')); grid on; title ('Polarización circular')    
else
    set(gcf, 'Position', get(0, 'Screensize')); grid on; title ('Polarización elíptica')
end
axis('equal');

%Código para graficar durante la ejecución
for k = 1:length(Ex)
    addpoints(h,t(k),Ex(k),Ey(k));
    drawnow
end