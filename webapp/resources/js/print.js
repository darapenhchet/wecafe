 

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
		printWindow.document.write(pageStyle +" " +getellipsis());
	 	printWindow.document.write("</style></head>");
	 	printWindow.document.write("<body>");
	 		printWindow.document.write(divContents);
	 	printWindow.document.write("</body>");
	 printWindow.document.write("</html>");
	
	 printWindow.document.close();
	 printWindow.print();
	 
}

function getellipsis(){
	
	var ellipsis=".ellipsis {"
			+"display: inline-block;"
			+"width: 99%;"
			+"text-overflow: ellipsis;"
			+"white-space: nowrap;"
			+"overflow: hidden;"
			+"}"
			
	return ellipsis;
}

function pagePrintPortrait(){
	var page_Print="@media print { "

		+"table { page-break-inside:auto !important; } "
		+"tr    { page-break-inside:avoid !important; page-break-after:auto  !important;}"
		+"html,body {"
		+"width: 900px !important;"
		+"box-shadow: 0;"
		+"position:absolute;"
		+"left:0;"
		+"top: 0;"
		+" margin :0 auto;"
		+"padding: 0;"
		+" overflow: hidden;"
		+" }"
		+"}";
	return page_Print;
}

function pagePrintLanscape(){
	var page_Print="@media print { "

		/*+" table { page-break-inside:auto } "
		+"tr    { page-break-inside:avoid; page-break-after:auto } "*/
		+"table tr th   {padding:8px !important;}"
		//+"table{font-size:12px;}"
		+"html,body {"
		+"width:auto;"
		+"height:auto;"
		+"box-shadow: 0;"
		+"position:absolute;"
		+"h2{text-align: center;}"
		//+"position:absolute;"
		//+"left:0;"
		//+"top: 0;"
		+" margin :0 auto;"
		+"padding: 0;"
		//+" overflow: hidden;"
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
			+"width:auto;"
			+"height:auto;"
			+"display: block !important;"
			+"orphans:4; widows:2;"
			+"margin-top: 0.5cm;"
			+"margin-bottom: 0.5cm;"
	
			+"} " + pagePrintLanscape();
	return land;
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
		  +"margin-top: 0.5cm;"
		  +"margin-bottom:0.5cm;} "  +pagePrintPortrait();
		 return pot;
	}


		/*@media print {

		table { page-break-inside:auto !important; }
		tr    { page-break-inside:avoid !important; page-break-after:auto  !important;}
		 html,body, page[size="A4"] {
		  	 width: 850px !important;
		     box-shadow: 0;
		     position:absolute;
		     left:0;
		     top: 0;
		    margin :0 auto;
		     padding: 0;
		     overflow: hidden;
		    }
		 

		  }*/
		 




/*function pageLanscape(){
	
	var style="";
	
	style="<style type=\"text/css\"> "
			+"@page { "
			+"size: landscape; "
			+"background: white;"
			+"margin-top: 0.5cm; margin-bottom : 0.1cm; margin-left : 1cm;"
			+"margin-right : 2cm;"
			+"box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);"
			+"margin-bottom: 0.1cm;"
			+"margin-left: 1cm;"
			+"margin-right: 2cm;"
			+"} "
		
			+"@media print {"
			+"html, body, page[size=\"A4\"] {"
			+"width: 1350px !important;"
			+"margin: 0;"
			+"margin-top: 10px;"
			+"box-shadow: 0;"
			+"}"
			+"}"
			+"</style>"
	return style;
	
}*/


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
