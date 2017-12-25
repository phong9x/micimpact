var loadFile = function(event,id) {

		 var reader = new FileReader();
		    reader.onload = function(){
		      var filename = document.getElementById("file_"+id).value;
		      var fileSize = document.getElementById("file_"+id).files[0].size;
		      var lastIndex = filename.lastIndexOf("\\");
		      if (lastIndex >= 0) {
		          filename = filename.substring(lastIndex + 1);
		      }
		      if(fileSize>0){
		    	  document.getElementById("file_name_"+id).value = filename;
		      }
		    };
		    reader.readAsDataURL(event.target.files[0]);

};

function click_upload(id){
	document.getElementById("file_"+id).click();
}(jQuery);

$(function() {
    var startDate;
    var endDate;
    var selectCurrentWeek = function() {
      window.setTimeout(function() {
        $('.micimpact_picker').find('.ui-datepicker-current-day a').addClass('ui-state-active')
      }, 1);
    }

    $('.date-picker').datepicker({
    	showOtherMonths: true,
    	selectOtherMonths: true,
    	onSelect: function(dateText, inst) {
            var date = $(this).datepicker('getDate');
            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate());
            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
            $('#day').val($.datepicker.formatDate(dateFormat, startDate, inst.settings));
            $('#startDate').val("");
            $('#endDate').val("");
            $('#month').val("");
            $('#year').val("");
            $("#stats_form").submit();
          }
    }	
    );
    
    $('.week-picker').datepicker({
      showOtherMonths: true,
      selectOtherMonths: true,
      onSelect: function(dateText, inst) {
        var date = $(this).datepicker('getDate');
        startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
        endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);
        var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
        $('#startDate').val($.datepicker.formatDate(dateFormat, startDate, inst.settings));
        $('#endDate').val($.datepicker.formatDate(dateFormat, endDate, inst.settings));
        $('#day').val("");
        $('#month').val("");
        $('#year').val("");
        $("#stats_form").submit();
        selectCurrentWeek();
      },
      beforeShowDay: function(date) {
        var cssClass = '';
        if (date >= startDate && date <= endDate)
          cssClass = 'ui-datepicker-current-day';
        return [true, cssClass];
      },
      onChangeMonthYear: function(year, month, inst) {
        selectCurrentWeek();
      }
    });

    $('.month-picker').datepicker({
    	showOtherMonths: true,
    	 changeMonth: true,
         changeYear: true,
         dateFormat: "MM",
         onChangeMonthYear: function(year, month, inst) {
        	 //Get the selected month value
             var month = $(".month-picker .ui-datepicker-month :selected").val();
             var year = $(".month-picker .ui-datepicker-year :selected").val();
             var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
             $('#startDate').val("");
             $('#endDate').val("");
             $('#day').val("");
             $('#month').val(month);
             $('#year').val(year);
             $("#stats_form").submit();
           },
           beforeShow: function (e, t) {
        	   
               $(this).datepicker("hidden");
               $('.ui-datepicker-calendar').toggleClass('hide-calendar', $(el).is('[data-calendar="false"]'));
               $('.ui-datepicker-calendar').hide();
           }
        
     });

    
    
    
    
    $('.week-picker .ui-datepicker-calendar tr').on('mousemove', function() {
      $(this).find('td a').addClass('ui-state-hover');
    });
    $('.week-picker .ui-datepicker-calendar tr').on('mouseleave', function() {
      $(this).find('td a').removeClass('ui-state-hover');
    });
    
    
    
    
    
  });