%%% BP Algorithm
clear all;
clc;

% initialize
l = 0.05;
n = 30;
cells = 15;
times = 4000;

% generating data
for j=1:n
    x(j) = 2*pi*j/n;
end

t = 0.5*(1 + cos(x));
w1 = rand(cells,1) * 0.05;
w2 = rand(1,cells)*0.05;
yw1 = rand(cells,1)*0.05;
yw2 = rand * 0.05;
y = rand * 0.05;
count = 1;
e =[];

%% training
for i=1:times
    ei = 0;
    for a = 1:n
        net1 = w1 * x(a) - yw1;
        out = logsig(net1);
        net2 = w2 * out - yw2;
        y(a) = net2;
        det2 = t(a) - y(a);
        det1 = ((det2 * (w2)')) .* out .*(1 - out);
        w1 = w1 + det1*x(a)*l;
        w2 = w2 + (det2 * out)'*l;
        yw1 = -det1*l + yw1;
        yw2 = -det2*l + yw2;
        ei = ei + ((det2)^2)/2;
        e(count) = ei;
    end
    if ei<0.008
        break;
    end
    count = count + 1;
end

%±Æ½üÑ§Ï°ÇúÏß
for a = 1:n
    net1 = w1*x(a)-yw1;
    out = logsig(net1);
    net2 = w2*out-yw2;
    y(a) = net2;
end

%% plot
subplot(2,1,1);
plot(x,t,'b-',x,y,'k*-');
xlabel('x');
ylabel('y = 0.5*(1+cos(x))');

subplot(2,1,2);
plot(1:length(e),e);
grid on;
