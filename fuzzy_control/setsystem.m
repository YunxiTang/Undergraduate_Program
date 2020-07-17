clear all
%phi is heading angle and theta is rudder angle
% parameters of car model
La = 2;

%speed 
v = 2;
ts = 4;

% import fuzzy system of 'parkcarr'
fuzzysys = readfis('parkcarr');

%initial posture
x(1) = 80;
y(1) = 500;
phi(1) = 10;
theta(1) = 0;

N = 2000;
for i=1:N
    input = [phi(i),x(i)]+ rand([1,1])*0.1;
    output = evalfis(input,fuzzysys);
    %±ÈÀýÒò×Ó1.5
    theta(i) = 2.5*output;
    x(i+1) = x(i) - v*ts*cos(theta(i)*pi/180)*cos(phi(i)*pi/180);
    y(i+1) = y(i) - v*ts*sin(phi(i)*pi/180)*cos(theta(i)*pi/180);
    phi(i+1) = phi(i) - (v*ts/La)*sin(theta(i)*pi/180);
    if y(i)<=0
        break;
    end
end

% park site
site;
axis([0 100 0 800]);
hold on;
pause(1);

for i = 1:length(x)-1
    plot(x(i),y(i));
    draw(x(i),y(i),phi(i),theta(i));
    pause(0.1);
    hold on;
end

