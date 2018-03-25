$(function(){
	
	//convert svg images to inline
    jQuery('img.svg').each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');
		var imgOnMouseOver = $img.attr('onmouseover');
		var imgOnMouseOut = $img.attr('onmouseout');
    
        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');
    
            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }
            // Add replaced image's onmouseover to the new SVG
            if(typeof imgOnMouseOver !== 'undefined') {
                $svg = $svg.attr('onmouseover', imgOnMouseOver+' replaced-svg');
            }			
            // Add replaced image's onmouseout to the new SVG
            if(typeof imgOnMouseOut !== 'undefined') {
                $svg = $svg.attr('onmouseout', imgOnMouseOut+' replaced-svg');
            }				
            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');
            
            // Check if the viewport is set, else we gonna set it if we can.
            if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
                $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'))
            }
    
            // Replace image with new SVG
            $img.replaceWith($svg);
    
        }, 'xml');
    
    });
});