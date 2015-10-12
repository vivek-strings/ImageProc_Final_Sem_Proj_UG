clear; clc;
url = 'http://100.74.219.9:8080/shot.jpg';
pause(2);

handles = guidata(act_ive_gui_new);
act_ive_gui_new('pushbutton1_Callback', handles.pushbutton1, 0, handles)
pause(1);

playState = 0;

while 1
ss = imread(url);
k=ss(:,:,1)<=135 & ss(:,:,1)>=100 & ss(:,:,2)<=40 & ss(:,:,2)>=10 & ss(:,:,3)<=40 & ss(:,:,3)>=10;
se=strel('disk', 5);
e=imclose(k, se);
f=imfill(e, 'holes');

[stat num]=bwlabel(f);
disp(num);

%turn the Player ON
if num==1
act_ive_gui_new('pushbutton2_Callback', handles.pushbutton2, 0, handles);
playState = 1;


%PAUSE the player
elseif num==3
act_ive_gui_new('pushbutton4_Callback', handles.pushbutton4, 0, handles);
playState = 0;

else
    
end

end