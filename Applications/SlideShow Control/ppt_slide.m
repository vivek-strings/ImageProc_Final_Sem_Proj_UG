%Initialize
ppt = actxserver('powerpoint.application');
ppt.Visible = 1;
h = ppt.Presentations.Open('C:\Users\SAMSUNG\Desktop\abc.ppt');

%Add slides
i = ppt.ActivePresentation.Slides.Count;
layout = ppt.ActivePresentation.SlideMaster.CustomLayouts.Item(1);
ppt.ActivePresentation.Slides.AddSlide(i+1, layout);

%Save PPT
ppt.ActivePresentation.Save;

%Slide Show
ppt.ActivePresentation.SlideShowWindow.View.Next;
ppt.ActivePresentation.SlideShowWindow.View.Previous;
ppt.ActivePresentation.SlideShowWindow.View.Exit;

%Close all
ppt.ActivePresentation.Close;
ppt.Quit;
ppt.delete;