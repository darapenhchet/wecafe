 

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
	
	$("#select_month").change(function(){
		if($(this).val()==2){
			$(".hide").removeClass("hide").addClass("show2");
			$(".show1").addClass("hide");
		}else{
			$(".hide").removeClass("hide");
			$(".show2").addClass("hide");
		}
	});


	$("#print_report").click(function(){
		
		 var beforePrint = function() {	    	
		    	alert("before");
		    };
		    var afterPrint = function() {
		    	alert("after");
		    	
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


function loadPrintPage(divContents,pageStyle){
	
	  var params = [
		               'height='+screen.height,
		               'width='+screen.width,
		               'fullscreen=yes',
		                'resizable=no'
		           ].join(',');
	 printWindow = window.open("","",params );
	 printWindow.document.write("<html>");
	 	printWindow.document.write("<head>");
	 		printWindow.document.write('<link href="/WeCafe/resources/css/customize.css" rel="stylesheet" type="text/css" />');
	 		printWindow.document.write("<style type=\"text/css\"> ");			
	 				printWindow.document.write(pageStyle);
	 		printWindow.document.write("</style>");
	 	printWindow.document.write("</head><body>");
	 		printWindow.document.write(divContents);
	 		printWindow.document.write('<script src="/WeCafe/resources/js/jquery.min.js"></script> <script src="/WeCafe/resources/js/print.js"></script>');
	 	printWindow.document.write("</body>");
	 printWindow.document.write("</html>");
	
	 printWindow.document.close();
	 printWindow.print();
	 
}




function pagePrintPortrait(){
	var page_Print="@media print { "

		+"table { page-break-before: always;page-break-after: always; !important;line-height:22px; } "
		+"tr    {  page-break-inside: avoid; !important; page-break-after:auto  !important;}"
		+"html,body {"
		+"width: 900px !important;"
		+"box-shadow: 0;"
		+"position:absolute;"
		+"left:0;"
		+"top: 0;"
		+" margin :0 auto;"
		+"padding: 0;"
		
		+" }"
		+"}";
	return page_Print;
}



function getPortrait(){
	
	var pot="@page { "
		  +"size: A4; "
		  +"background: white;"
		  +"width:auto;"
		  +"height:auto;"
		  +"display: block !important;"
		  +"orphans:4; widows:2;"
		  +"margin: 0 auto;"
		  +"padding: 0;"
		  +"margin-top:0.21in;"
		  +"margin-bottom:01cm;"
		  +"margin-left:0.24in;"
		  +"margin-right:0.22in;}" + pagePrintPortrait();
		 return pot;
	}


	
function pagePrintLanscape(){
	var page_Print="@media print { "
		+" table {page-break-inside : auto;border:none !important;line-height:22px;} "
		+"table tr    { page-break-inside:avoid; page-break-after:auto; } "
		+"html,body ,page[size=\"landscape\"] {"
		+"h1 { page-break-before : right } "
		+"h2 { page-break-after : avoid }"
		+"width:auto !important;"
		+"position:absolute;"
		+"margin :0 auto;"
		+"padding: 0;"
		+" }"
		+"}";
	return page_Print;
}

function getLangScape(){
	var land="@page { "
			+"size: landscape; "
			+"background: white;"
			+"margin:0 auto;"
			+"padding:0;"
			+"width:100%;"
			+"height:100%;"
			+"display: block !important;"
			+"orphans:4; widows:2;"
			+"margin-top:0.21in;"
			+"margin-bottom:01cm;"
			+"margin-left:0.24in;"
			+"margin-right:0.22in;"
	
			+"} " + pagePrintLanscape();
	return land;
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
