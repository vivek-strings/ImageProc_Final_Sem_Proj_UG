v=videoinput('winvideo',2);

while 1
i=getsnapshot(v);
y=i;
k=y(:,:,1)<=100 & y(:,:,1)>=80 & y(:,:,2)<=40 & y(:,:,2)>=25 & y(:,:,3)<=20 & y(:,:,3)>=10;
f=imfill(k, 'holes');
se=strel('disk', 5);
e=imerode(f, se);

[stat num]=bwlabel(e);
disp(num);
if num==1
    r=regionprops(stat);
    a=r.Centroid;
    cx=a(1:2:end-1);
    cy=a(2:2:end);
    if(cx<280)
        %fwrite(s, 'L');
        disp('l');
    elseif(cx>360)
        %fwrite(s, 'R');
        disp('r');
    else
        %fwrite(s, 'S');
        disp('s');
    end
     if(cy<270)
        %fwrite(s, 'B');
        disp('b');
    elseif(cy>320)
        %fwrite(s, 'F');
        disp('f');
    else
        %fwrite(s, 'S');
        disp('s');
     end
end
end