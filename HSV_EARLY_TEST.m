X = imread('yoo2.jpg');
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

%{
    z = zeros(size(X(:,:,3)));
    redAppearingImage = cat(3, z, z, X(:,:,3));
    imshow(redAppearingImage);
    uisetcolor([unit_rgb])
%}
xlabel('Red');
ylabel('Green');
zlabel('Blue');