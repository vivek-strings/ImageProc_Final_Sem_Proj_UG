clear; clc;
url = 'http://100.74.219.9:8080/shot.jpg';
ppt = actxserver('powerpoint.application');
ppt.Visible = 1;
h = ppt.Presentations.Open('C:\Users\SAMSUNG\Desktop\abc.ppt');
pause(5);

while 1
ss = imread(url);
k=ss(:,:,1)<=135 & ss(:,:,1)>=100 & ss(:,:,2)<=40 & ss(:,:,2)>=10 & ss(:,:,3)<=40 & ss(:,:,3)>=10;
se=strel('disk', 5);
e=imclose(k, se);
f=imfill(e, 'holes');

[stat num]=bwlabel(f);
disp(num);

pause(0.5);

if num==1
ppt.ActivePresentation.SlideShowWindow.View.Next;
elseif num==2
ppt.ActivePresentation.SlideShowWindow.View.Previous;
elseif num==4
ppt.ActivePresentation.SlideShowWindow.View.Exit;
else
end
pause(1);
end

ppt.ActivePresentation.Save;
ppt.ActivePresentation.Close;
ppt.Quit;
ppt.delete;