 

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

function getScript(){
	
	return '<script src="${pageContext.request.contextPath}/resources/print.js"></script>';
}

function loadPrintPage(divContents,pageStyle){
	
	  var params = [
		               'height='+screen.height,
		               'width='+screen.width,
		               'fullscreen=yes',
		                'resizable=no'
		           ].join(',');
	 printWindow = window.open("","",params );
	 printWindow.document.write("<html>");
	 	printWindow.document.write("<head><style type=\"text/css\"> ");
		printWindow.document.write(pageStyle +" " +getellipsis() +" "+ getTableBorder());
	 	printWindow.document.write("</style></head>");
	 	printWindow.document.write("<body>");
	 		printWindow.document.write(divContents);
	 		printWindow.document.write("<script>");
	 		printWindow.document.write(getScript());
	 		printWindow.document.write("</script>");
	 	printWindow.document.write("</body>");
	 printWindow.document.write("</html>");
	
	 printWindow.document.close();
	 printWindow.print();
	 
}

function getTableBorder(){
	var table="table {border-collapse: collapse;width:100%;} " 
	 		+"table tr th   {padding:8px !important;}"
	 		+"table,td,th{text-align: center;font-size:12px;border: 1px solid black;}";
	return table;
}

function getellipsis(){
	
	var ellipsis=".ellipsis {"
			+"display: inline-block;"
			+"width:100%;"
			+"text-overflow: ellipsis;"
			+"white-space: nowrap;"
			+"overflow: hidden;"
			+"}"
			
	return ellipsis;
}

function pagePrintPortrait(){
	var page_Print="@media print { "

		+"table { page-break-inside:auto !important;line-height:22px; } "
		+"tr    { page-break-inside:avoid !important; page-break-after:auto  !important;}"
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
