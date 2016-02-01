

$(function(){
	
	$.fn.beforeprint = function(callback) {
	    return $(this).each(function() {
	        if ( !jQuery.isWindow(this) )
	            return;
	        if ( this.onbeforeprint !== undefined )
	            $(this).on('beforeprint', callback);
	        else if ( this.matchMedia )
	            this.matchMedia('print').addListener(callback);
	    });
	};
	$.fn.afterprint = function(callback) {
	    return $(this).each(function() {
	        if ( !jQuery.isWindow(this) )
	            return;
	        if ( this.onafterprint !== undefined )
	            $(this).on('afterprint', callback);
	        else if ( this.matchMedia )
	            $(this).one('mouseover', callback);
	    });
	};


	$("#btn_print").click(function(){
		
		 var beforePrint = function() {	    	
		    	$("#record_num").hide();
				$("#select_num").hide();
				$(".pagination").hide();
				$("#btn_print").hide();$(".status").hide();
				$(".signature").show();$(".signature1").show();
				$(".othertd").show();$("#otherth").show();
			    $("#break_row").show();
		    };
		    var afterPrint = function() {
		    	$("#record_num").show();
		    	$(".pagination").show();
		    	$("#btn_print").show();$(".status").show();
		    	$(".signature").hide();$(".signature1").hide();
		    	$("#select_num").show();
		    	$(".othertd").hide();$("#otherth").hide();	
		    	$("#break_row").hide();
		    	
		    };
		
		
		if (window.matchMedia) {
	        var mediaQueryList = window.matchMedia('print');
	        mediaQueryList.addListener(function(mql) {
	            if (mql.matches) {
	                beforePrint();
	            } else {
	                afterPrint();
	                window.close();
	                alert();
	            }
	        });
	    }

	    window.onbeforeprint = beforePrint;
	    window.onafterprint = afterPrint;
	  
		
	});
	

	
});


function loadPrintPage(divContents){
	  var params = [
		               'height='+screen.height,
		               'width='+screen.width,
		               'fullscreen=yes',
		                'resizable=no'
		           ].join(',');
	 printWindow = window.open('', '',params );
	 printWindow.document.write('<html><head>');
	 printWindow.document.write('</head><body >');
	 printWindow.document.write(divContents);
	 printWindow.document.write('</body></html>');
	 printWindow.document.close();
	 printWindow.print();
}


function popup(url ) 
{
	 var params = [
	               'height='+screen.height,
	               'width='+screen.width,
	               'fullscreen=yes',
	                'resizable=no'
	           ].join(',');               

	           var popup = window.open(url, 'popup_window', params); 
	           popup.moveTo(0,0);
return false;
}
