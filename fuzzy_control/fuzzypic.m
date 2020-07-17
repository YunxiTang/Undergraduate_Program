function [ x,phi,theta ] = fuzzypic( xr,yr,phi )
% fuzzypic() (xr,yr,phi) is the initial posture of car model
% x is an array of x-postions 
% phi is an array of heading angels
% theta is an array of rudder angels
%phi is heading angle and theta is rudder angle
% AUTHOR: TANG Yunxi  Date:2018/11/24

% parameters of car model
La = 2;

%speed 
v = 2;
ts = 2;

% import fuzzy system of 'parkcarr'
fuzzysys = readfis('parkcarr');

%initial posture
x(1) = xr;
y(1) = yr;
phi(1) = phi;
theta(1) = 0;

N = 2000;
for i=1:N
    if sqrt(x(i)^2 + y(i)^2) > 200
        v = 4;
    else
        v = 2;
    end
    input = [phi(i),x(i)];
    output = evalfis(input,fuzzysys);
    
    %±ÈÀýÒò×Ó3.0
    theta(i) = 3.0*output;
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
end

