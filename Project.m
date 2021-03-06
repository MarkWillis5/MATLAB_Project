%% ECE 2409-002
%% Final Project
%% Mark Willis & Vasilios Seitaridis

Published = datestr(now, 21)
clc; clear; close all;
%% Part 1
m=imread('FinalProjectPicture.jpg');
imshow(m)

green=m(383:429,81:135,:);
r=green(:,:,1);
g=green(:,:,2);
b=green(:,:,3);

figure
hold
histogram(r,'facecolor','r')
histogram(g,'facecolor','g')
histogram(b,'facecolor','b')
set(gca,'fontsize',12)
title('Green')

figure
imshow(green)
title('Green');



red=m(504:543,1068:1108,:);
r=red(:,:,1);
g=red(:,:,2);
b=red(:,:,3);

figure
histogram(r,'facecolor','r')
hold
histogram(g,'facecolor','g')
histogram(b,'facecolor','b')
set(gca,'fontsize',12)
title('Red')

figure
imshow(red)
title('red');



orange=m(734:782,174:225,:);
r=orange(:,:,1);
g=orange(:,:,2);
b=orange(:,:,3);

figure
hold
histogram(r,'facecolor','r')
histogram(g,'facecolor','g')
histogram(b,'facecolor','b')
set(gca,'fontsize',12)
title('Orange')

figure
imshow(orange)
title('orange');



yellow=m(633:678,939:991,:);
r=yellow(:,:,1);
g=yellow(:,:,2);
b=yellow(:,:,3);

figure
histogram(r,'facecolor','r')
hold
histogram(g,'facecolor','g')
histogram(b,'facecolor','b')
set(gca,'fontsize',12)
title('Yellow')

figure
imshow(yellow)
title('yellow');



blue=m(809:861,927:978,:);
r=blue(:,:,1);
g=blue(:,:,2);
b=blue(:,:,3);

figure
histogram(r,'facecolor','r')
hold
histogram(g,'facecolor','g')
histogram(b,'facecolor','b')
set(gca,'fontsize',12)
title('Blue')

figure
imshow(blue)
title('blue');



brown=m(528:560,504:549,:);
r=brown(:,:,1);
g=brown(:,:,2);
b=brown(:,:,3);

figure
histogram(r,'facecolor','r')
hold
histogram(g,'facecolor','g')
histogram(b,'facecolor','b')
set(gca,'fontsize',12)
title('Brown')

figure
imshow(brown)
title('brown');

%% Part 3
r = m(:,:,1);
g = m(:,:,2);
b = m(:,:,3);
[x y] = size(m);

% find and remove what isn't green
notgreen = find(not(g>b & g>r & g-r>b));
GreenPic = m;
GreenPic(notgreen) = 252;
GreenPic(notgreen+x*y/3) = 252;
GreenPic(notgreen+2*x*y/3) = 252;

% find and remove what isn't red
notred = find(not(r>b & r>g & g-b<b & g-b<b & r-g-b>g));
RedPic = m;
RedPic(notred) = 252;
RedPic(notred+x*y/3) = 252;
RedPic(notred+2*x*y/3) = 252;

% find and remove what isn't orange
notorange = find(not(r>b & r>g & g>b & g-b<r-g & b+g<r & r-g>g));
OrangePic = m;
OrangePic(notorange) = 252;
OrangePic(notorange+x*y/3) = 252;
OrangePic(notorange+2*x*y/3) = 252;

% find and remove what isn't yellow
notyellow = find(not(r>b & g>b & g-b>=r-g & r-g<r & g-b<r & r-b>b));
YellowPic = m;
YellowPic(notyellow) = 252;
YellowPic(notyellow+x*y/3) = 252;
YellowPic(notyellow+2*x*y/3) = 252;

% find and remove what isn't blue
notblue = find(not(g>r & b>r & g<b & g-r<b & b-r>r));
BluePic = m;
BluePic(notblue) = 252;
BluePic(notblue+x*y/3) = 252;
BluePic(notblue+2*x*y/3) = 252;

% find and remove what isn't brown
notbrown = find(not(b+g>r & b+r>g & g+r>b & g-b<b & r>b & r-g<g & r>g));
BrownPic = m;
BrownPic(notbrown) = 252;
BrownPic(notbrown+x*y/3) = 252;
BrownPic(notbrown+2*x*y/3) = 252;


%% Counts
% Green: 155
% Red: 90
% Orange: 114
% Yellow: 147
% Blue: 144
% Brown: 113

Factor=914;
SizePic = size(m);
PixelCount = SizePic(1)*SizePic(2);

greenCountPixels = PixelCount - length(notgreen);
greenCount = greenCountPixels/PixelCount*Factor;

redCountPixels = PixelCount - length(notred);
redCount = redCountPixels/PixelCount*Factor;

orangeCountPixels = PixelCount - length(notorange);
orangeCount = orangeCountPixels/PixelCount*Factor;

yellowCountPixels = PixelCount - length(notyellow);
yellowCount = yellowCountPixels/PixelCount*Factor;

blueCountPixels = PixelCount - length(notblue);
blueCount = blueCountPixels/PixelCount*Factor;

brownCountPixels = PixelCount - length(notbrown);
brownCount = brownCountPixels/PixelCount*Factor;
%% All filters at once
countColor = find(not((g>b & g>r & g-r>b)|(r>b & r>g & g-b<b & g-b<b & r-g-b>g)|(r>b & r>g & g>b & g-b<r-g & b+g<r & r-g>g)|(r>b & g>b & g-b>=r-g & r-g<r & g-b<r & r-b>b)|(g>r & b>r & g<b & g-r<b & b-r>r)|(b+g>r & b+r>g & g+r>b & g-b<b & r>b & r-g<g & r>g)));
temp = m;
temp(countColor) = 252;
temp(countColor+x*y/3) = 252;
temp(countColor+2*x*y/3) = 252;
figure
imshow(temp);
title('Other Bear');
%% Pixels used vs. Actual
countUsed = length(find((g>b & g>r & g-r>b)|(r>b & r>g & g-b<b & g-b<b & r-g-b>g)|(r>b & r>g & g>b & g-b<r-g & b+g<r & r-g>g)|(r>b & g>b & g-b>=r-g & r-g<r & g-b<r & r-b>b)|(g>r & b>r & g<b & g-r<b & b-r>r)|(b+g>r & b+r>g & g+r>b & g-b<b & r>b & r-g<g & r>g)));
countObserved = greenCountPixels + redCountPixels + orangeCountPixels + yellowCountPixels + blueCountPixels + brownCountPixels;
countDifference = countObserved - countUsed;


%% Pictures
figure
imshow(GreenPic);
d = ['title(''Green M&Ms: ',int2str(greenCount),' counted ',int2str(greenCount/155*100),' percent'');'];
eval(d)

figure
imshow(RedPic);
d = ['title(''Red M&Ms: ',int2str(redCount),' counted ',int2str(redCount/155*100),' percent'');'];
eval(d)

figure
imshow(OrangePic);
d = ['title(''Orange M&Ms: ',int2str(orangeCount),' counted ',int2str(orangeCount/155*100),' percent'');'];
eval(d)

figure
imshow(YellowPic);
title('Yellow Bear');
d = ['title(''Green M&Ms: ',int2str(redCount),' counted ',int2str(redCount/155*100),' percent'');'];
eval(d)

figure
imshow(BluePic);
title('Blue Bear');
d = ['title(''Blue M&Ms: ',int2str(blueCount),' counted ',int2str(blueCount/155*100),' percent'');'];
eval(d)

figure
imshow(BrownPic);
title('Brown Bear');
d = ['title(''Brown M&Ms: ',int2str(brownCount),' counted ',int2str(brownCount/155*100),' percent'');'];
eval(d)