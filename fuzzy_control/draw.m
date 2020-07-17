function [] = draw(xr,yr,phi,theta)
%drawcar() draw a car in the screen
%   date:2018/11/22 by Yunxi Tang
%length and width of car model
t = 20;
l= 40;
wd = 10;

phi = phi*pi/180;
theta = (theta+90)*pi/180;

ax = [cos(phi),sin(phi)];
bx = [cos(phi+pi/2),sin(phi+pi/2)];
cx = [cos(theta),sin(theta)];

xf = xr + l*cos(phi);
yf = yr + l*sin(phi);

x1 = xr + t*bx(1)/2;
y1 = yr + t*bx(2)/2;

x2 = x1 - t*bx(1);
y2 = y1 - t*bx(2);

x3 = x2 + l*ax(1);
y3 = y2 + l*ax(2);

x4 = x1 + l*ax(1);
y4 = y1 + l*ax(2);

%wheels
%front wheels
xwf1 = x3 + wd*cx(1);
ywf1 = y3 + wd*cx(2);
xwf2 = x3 - wd*cx(1);
ywf2 = y3 - wd*cx(2);

xwf3 = x4 + wd*cx(1);
ywf3 = y4 + wd*cx(2);
xwf4 = x4 - wd*cx(1);
ywf4 = y4 - wd*cx(2);

xwb1 = x1 + wd*ax(1);
ywb1 = y1 + wd*ax(2);
xwb2 = x1 - wd*ax(1);
ywb2 = y1 - wd*ax(2);

xwb3 = x2 + wd*ax(1);
ywb3 = y2 + wd*ax(2);
xwb4 = x2 - wd*ax(1);
ywb4 = y2 - wd*ax(2);

%front wheels
line([xwf1,xwf2],[ywf1,ywf2],'lineWidth',2,'Color','r');
line([xwf3,xwf4],[ywf3,ywf4],'lineWidth',2,'Color','r');

%back wheels
line([xwb1,xwb2],[ywb1,ywb2],'lineWidth',2,'Color','g');
line([xwb3,xwb4],[ywb3,ywb4],'lineWidth',2,'Color','g');
%car
line([x1,x2,x3,x4,x1],[y1,y2,y3,y4,y1],'lineWidth',0.5);
axis equal;
end

