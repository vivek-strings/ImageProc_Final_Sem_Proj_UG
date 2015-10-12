pause(5);

i=1;

while i<=3

    ppt.ActivePresentation.SlideShowWindow.View.Next;
    
    pause(2);

i = i+1;

end

i=1;
while i<=3

ppt.ActivePresentation.SlideShowWindow.View.Previous;

pause(2)

i = i+1;

end

ppt.ActivePresentation.SlideShowWindow.View.Exit;
