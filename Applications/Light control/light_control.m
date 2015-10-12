clear; clc;
url = 'http://100.74.219.9:8080/shot.jpg';

last_state=[0 0 0];	   %Stores last state of three LEDs
 
a=arduino ('COM22');         %object constructor for Arduino control
 
pin=[12 11 10];		   %Pin number on Arduino board
 
%declare pin mode as output for the Digital Pins on Arduino board
a.pinMode(pin(1),'output');     
a.pinMode(pin(2),'output');
a.pinMode(pin(3),'output');

while 1

ss = imread(url);

%thresolding or feature extraction
k=ss(:,:,1)<=135 & ss(:,:,1)>=100 & ss(:,:,2)<=40 & ss(:,:,2)>=10 & ss(:,:,3)<=40 & ss(:,:,3)>=10;
se=strel('disk', 5);
e=imclose(k, se);
f=imfill(e, 'holes');

%count number of Region of Interest
[stat num]=bwlabel(f);
disp(num);

%Take a decision based on the calculated Region of Interest

if num==1

last_state(1) = ~last_state(1);
     a.digitalWrite(pin(1),last_state(1));
    
elseif num==2

    last_state(2) = ~last_state(2);
     a.digitalWrite(pin(2),last_state(2));
    
elseif num==3

last_state(3) = ~last_state(3);
     a.digitalWrite(pin(3),last_state(3));
        
elseif num==4

    a.digitalWrite(pin(1),0);
    a.digitalWrite(pin(2),0);
    a.digitalWrite(pin(3),0);
    last_state(1:4)=0;
    
    break;
    
end                     %end of if

pause(2);
 
end                     % end of while
 
delete(a);		    % delete the object constructor