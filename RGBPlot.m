% Program Analyze an Image and Get color
%I = imread('yoo.png');
%imshow(I(:,:,3))

% Extracts the RGB of each pixel in the  image
%r = I(:,:,1);
%g = I(:,:,2);
%b = I(:,:,3);
%r = reshape(I(:,:,1),1,[]); %There should be away to easilt index throughout the matrix
%g = reshape(I(:,:,2),1,[]);
%b = reshape(I(:,:,3),1,[]);
%numofPixels = size(r);
figure;
n = 0;
%hold on
points = cell(1,50);
color = jet(50);
for i = 1:50
   %Getting a weird error with my loop
   
   n = n + 1;
   %disp(i)
   color_Plot = '.k';
 
   r = 10*rand(10);
   g = 10*rand(10);
   b = 10*rand(10);
   
   points{i} = [r, g, b];
  % hold on
   %figure(1);
 %  plot3(r(i),g(i),b(i), color_Plot); %%Plot only can do X,Y, no Z. 
   
end

figure;
for i = 1:50
    plot3(points{i}(:,1), points{i}(:,2), points{i}(:,3),'.','Color',color(i,:));
end
% Produces R(1.....n) I want to get like point_1  = r(1) g(1) b(1)
Pixel = struct;
RGB_vector = [r g b];
Pixel.rgb = RGB_vector;
%RGB_vector(1,1,1);
%RGB_vector(:,1)


% Call it by RGB_vector(
%Call RGB value for a pixel by
%figure
%plot3(r,g,b, '.')

