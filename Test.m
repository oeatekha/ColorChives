r = reshape(I(:,:,1),1,[]); %There should be away to easilt index throughout the matrix
g = reshape(I(:,:,2),1,[]);
b = reshape(I(:,:,3),1,[]);

mumberofP = size(r)
points = cell(3,mumberofP);
color = jet(50);

points(1) = r;
points(2) = g;
points(3) = b;



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