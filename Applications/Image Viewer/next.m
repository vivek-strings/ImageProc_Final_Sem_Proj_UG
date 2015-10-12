%this code is used to move to the next image

clear; clc;
url = 'http://100.74.219.9:8080/shot.jpg';
i=687;
while i <=699
ss = imread(url);
k=ss(:,:,1)<=135 & ss(:,:,1)>=100 & ss(:,:,2)<=40 & ss(:,:,2)>=10 & ss(:,:,3)<=40 & ss(:,:,3)>=10;
se=strel('disk', 5);
e=imclose(k, se);
f=imfill(e, 'holes');

[stat num]=bwlabel(f);
disp(num);

if num == 1
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