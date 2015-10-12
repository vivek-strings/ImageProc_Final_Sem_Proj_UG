%this code is used to read images of the lectures of WIreless Communication
%given by Ranjan Bose, IIT D

clear; clc;
url = 'http://192.168.14.101:8080/shot.jpg';
i=687;
while i <=716
ss = imread(url);
k=ss(:,:,1)<=135 & ss(:,:,1)>=100 & ss(:,:,2)<=40 & ss(:,:,2)>=10 & ss(:,:,3)<=40 & ss(:,:,3)>=10;
se=strel('disk', 5);
e=imclose(k, se);
f=imfill(e, 'holes');

[stat num]=bwlabel(f);
num

if num ==1 || num == 2
        imurl = sprintf('00%d.jpg', i);
        try
             img = imread(imurl);
             imshow(img);
             i = i+1;
        catch me
            i = i+1;
        end
end
pause(2);
end