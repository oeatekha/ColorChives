X = imread('yoo2.jpg');
X = imshape('yoo2.jpg');
imshow(X);
r_pixels = reshape(X(:,:,1),1,[])'; %reshapes into a column vector
g_pixels = reshape(X(:,:,2),1,[])';
b_pixels = reshape(X(:,:,3),1,[])';
RGB_vec = {r_pixels, g_pixels, b_pixels};
numofPixels = size(r_pixels,1); 
random_sample = round(rand(1, 8000)*numofPixels); % for v = []
%acquires the size of pixels in the image
% This is how calling a specific pixel looks: b = RGB_vec{1,3}(1);
figure;
HSL_vec = ones([numofPixels 3]);
%Color = [0 0 0]; 

for i = random_sample
    
    Color = [RGB_vec{1,1}(i), RGB_vec{1,2}(i), RGB_vec{1,3}(i)];
    
    unit_rgb = double(Color)/255;
   %{
        Should be able to place Color in but MATLAB doesnt take vectors for
        %plot3, double(Color)/255
        %plot3(RGB_vec{1,1}(:), RGB_vec{1,2}(:), RGB_vec{1,3}(:),'.','Color',Color);
    %}
    plot3(RGB_vec{1,1}(i), RGB_vec{1,2}(i), RGB_vec{1,3}(i), 'o', 'Color', unit_rgb );
    hold on
    
end

xlabel('Red');
ylabel('Green');
zlabel('Blue');
hold off


for i = 1:numofPixels  % Take a 100,000 sample or reduce pixels
    HSL_val = rgbToHsl(double([RGB_vec{1,1}(i), RGB_vec{1,2}(i), RGB_vec{1,3}(i)]));
    HSL_vec(i,:) = HSL_val;
end

figure;

for i = random_sample
    
    Color = [RGB_vec{1,1}(i), RGB_vec{1,2}(i), RGB_vec{1,3}(i)];
    unit_rgb = double(Color)/255;
    plot3(HSL_vec(i,1), HSL_vec(i,2), HSL_vec(i,3), 'o', 'Color', unit_rgb);
    hold on
    
end

xlabel('H');
ylabel('S');
zlabel('L');
hold off

%{
    z = zeros(size(X(:,:,3)));
    redAppearingImage = cat(3, z, z, X(:,:,3));
    imshow(redAppearingImage);
    uisetcolor([unit_rgb])
%}
%
%rgbToHsl(Color) %Error with Color and its datatype into the rgbtohsl function
%    23   18   22
% 
% Output argument "rgb_HSL" (and maybe others) not assigned during call to "rgb_HSL".
