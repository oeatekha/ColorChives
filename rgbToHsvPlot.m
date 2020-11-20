function [RGB centroids_RGB HSV centroids_HSV HSL centroids_HSL] = rgbToHsvPlot(Image, N) 

    X = imshape(imread(Image));               %Resizes Image to 1/sqrt(8) size
    imshow(X);
    
    % RGB Declarations
    r_pixels = reshape(X(:,:,1),1,[])';       %reshapes into a column vector
    g_pixels = reshape(X(:,:,2),1,[])';
    b_pixels = reshape(X(:,:,3),1,[])';
    RGB_vec = {r_pixels, g_pixels, b_pixels}; % Cell to vector transformation
    numofPixels = size(r_pixels,1);           % Gets total size of each column of pixels for the plotting and HSL
    RGB =  cell2mat(RGB_vec);                 % Cell to mat
    
    % HSV Declaration
    HSV_vec = rgb2hsv(X);                     % Uses MATLAB's rgb2hsv function
    h = reshape(HSV_vec(:,:,1),1,[])';        % We reshape the vector to ensure that the values can be used by Kmeans
    s = reshape(HSV_vec(:,:,2),1,[])';
    v = reshape(HSV_vec(:,:,3),1,[])'; 
    HSV_cell = {h, s, v};
    HSV = cell2mat(HSV_cell);                 %Cell to mat
    HSV(:,1)  = HSV(:,1)*360;                 % Converts 0-1 range to 0-360 range
    HSV(:,2)  = HSV(:,2)*100;
    HSV(:,3)  = HSV(:,3)*100;
    
    % HSL Declaration
    for i = 1:numofPixels  
        
        % Takes the RGB_vec and compiles them using rgbToHsl a function that should be apart of the Git repository
        % Takes all the specific RGB values and euns them through the
        % function
        HSL_val = rgbToHsl(double([RGB_vec{1,1}(i), RGB_vec{1,2}(i), RGB_vec{1,3}(i)])); 
        HSL(i,:) = HSL_val;
              
    end
    
    
    % RGB Centroids
    [idx, centroids_RGB] = kmeans(double(RGB),N); % Centroid Kmeans function % Can we do this seeing RGB is a cell...
    
    % HSV Centroids     
    [idx, centroids_HSV] = kmeans(double(HSV),N); % Centroid Kmeans function
    
    %HSL Centroids
    [idx, centroids_HSL] = kmeans(double(HSL),N); % Centroid Kmeans function we don't use idx
    
    
    % Random Plot Sample Size % Random Sample of 8000 Pixels are used in Plot
    numofPixels = size(r_pixels,1); 
    random_sample = round(rand(1, 8000)*numofPixels);  
    
    
    % Plot RGB HSL HSV
    
    % HSV Plot
    
    figure;
    
    for i = random_sample
    
        Color = [RGB(i,1), RGB(i,2), RGB(i,3)];
        unit_rgb = double(Color)/255;
        plot3(HSV(i,1), HSV(i,2), HSV(i,3), 'o', 'Color', unit_rgb);   
        hold on
   
    end
    xlabel("H");
    ylabel("S");
    zlabel("V");
    grid on
    
    
    % RGB Plot
    figure;
    
    for i = random_sample
    
        Color = [RGB(i,1), RGB(i,2), RGB(i,3)];
        unit_rgb = double(Color)/255;
        plot3(RGB(i,1), RGB(i,2), RGB(i,3), 'o', 'Color', unit_rgb);
        hold on
    
    end
    xlabel("R");
    ylabel("G");
    zlabel("B");
    grid on
    grid minor
    
    % HSL Plot
    figure;
    
    for i = random_sample
    
        Color = [RGB(i,1), RGB(i,2), RGB(i,3)];
        unit_rgb = double(Color)/255;
        plot3(HSL(i,1), HSL(i,2), HSL(i,3), 'o', 'Color', unit_rgb);
        hold on
    
    end
    xlabel("H");
    ylabel("S");
    zlabel("L");
    grid on
    grid minor
    
%{
    % Convert Centroids to RGB Values and Plot
    % Okay currently we already have the rgb centroids...
    % The issue is getting the HSL rgb values cause I don't have a reverse
    % function... The dataset is large find the kmeans in the set and get
 %}   

    HSL_C_RGB = [];
    Near_HSL = round(centroids_HSL);  
    % Converts centroids to get color values for HSL
    % Converts HSV back to MATLAB form...
    % Using a nearest color method
    
    for i = 1:N
        for j = 1:length(RGB)
            distances(j) = norm(Near_HSL(i,:)-HSL(j,:));
        end
    [M K(i)] = min(distances)
    K; %%%
    HSL_C_RGB(i,:) = RGB(K(i),:)
    end 
    HSL_C_RGB;
    HSV_C_RGB = hsv2rgb([centroids_HSV(:,1)/360, centroids_HSV(:,2)/100, centroids_HSV(:,3)/100])
    centroids_RGB
    
    % RGB Centroids Colors
    figure;
    for i=1:N
        
        subplot(2,2,i);
        r = rectangle('Position',[0 0 1 1]');
        r.FaceColor = centroids_RGB(i,:)/255;
        title('RGB')
    end
    
    % HSV Centroids Colors
    figure;
    for i=1:N
        
        subplot(2,2,i);
        r = rectangle('Position',[0 0 1 1]');
        r.FaceColor = HSV_C_RGB(i,:);
        title('HSV')
    end
    
    % HSL Centroids Colors
    figure;
    for i=1:N
        
        subplot(2,2,i);
        r = rectangle('Position',[0 0 1 1]');
        r.FaceColor = HSL_C_RGB(i,:)/255;
        title('HSL')
    end
    

end