function watermark_image(uin)
% watermark_image(UIN) print UIN in bottom left corner of image of current
% axes
%   UIN is a number.  There is no output.  
	ax = gca; 
	t = text(min(ax.XLim),max(ax.YLim)-4,num2str(uin)); 
	t.Color = [0.7 0.7 0.7]; t.FontSize = 14; 
end