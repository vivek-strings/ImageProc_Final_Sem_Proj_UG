clear; clc;
url = 'http://27.62.220.3:8080/shot.jpg';
ss = imread(url);
fh = image(ss);
while(1)
ss = imread(url);
set(fh,'CData',ss);
drawnow;
pause(4);
end