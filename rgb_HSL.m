%Get Image and Plot 3d RGB points
% ColorVector [R G B]

function [rgb_HSL]= rgbToHsl(ColorVector) 
  k = 0;
  unit_rgb = ColorVector/255; %Basically rabs = r / 255;
  color_most_represented = max(unit_rgb);
  color_least_represented = min(unit_rgb);
  disp(ColorVector)
  
  diff = color_most_represented - min(unit_rgb); %This is used for
  h = (color_most_represented + color_least_represented) / 2;
  s = (color_most_represented + color_least_represented) / 2;
  l = (color_most_represented + color_least_represented) / 2;  
  
  %Calculates Luminace  Sets all values to mean of the others
  if (diff == 0) %achromatic meaning min = max
        h = 0;
        s = 0;
  else 
      s = diff/color_most_represented;
      if l > .5
        s = diff/(2-color_least_represented-color_most_represented);
        %If Luminance is bigger then 0.5. then Saturation = ( max-min)/(2.0-max-min)
      else
        s = diff/(color_least_represented+color_most_represented);
        %If Luminance is smaller then 0.5, then Saturation = (max-min)/(max+min)
      end
      round(s,2); % round to two decimal places
      
      %Find HUE
      switch color_most_represented %https://gist.github.com/mjackson/5311256
          
          case unit_rgb(1) %If Red is max, then Hue = (G-B)/(max-min)
              %case r: h = (g - b) / d + (g < b ? 6 : 0); break;
              h = (unit_rgb(2)-unit_rgb(3))/diff;
                if unit_rgb(2) < unit_rgb(3)
                  h = h + 6   %%
                end
          case unit_rgb(2)
              h = (unit_rgb(3)-unit_rgb(1))/diff + 2;
          case unit_rgb(3)
              h = 4 + (unit_rgb(1)-unit_rgb(2))/diff; 
          otherwise
             warning('Unexpected rgb value.')
      
      
       %Now convert it to degrees;
      end
      
  %h = h*60
  h = h*60
  
  if h< 0
      h = h +360
  end
  
  
  convertedval = [h s l]*100;
  convertedval2  = convertedval
   
  disp(convertedval)
  %disp(h)
  %disp(k)
  % Error primarily with blue at the moment
  %https://www.rapidtables.com/convert/color/rgb-to-hsl.html
 
  
  
end
