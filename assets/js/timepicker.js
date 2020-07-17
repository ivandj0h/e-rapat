/* -- DO NOT REMOVE --
 * jQuery TimePicker 1.0 plugin
 * 
 * Author: Dionlee Uy
 * Email: dionleeuy@gmail.com
 *
 * Date: Mon Mar 3 2013
 *
 * @requires jQuery
 * -- DO NOT REMOVE --
 */
 
(function ($) {

	var AM_PM = ['AM','PM'], MAX_HOUR = 12, MAX_MIN = 59,
		ACCEPTABLE_KEYS = [48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105 /*Num keys*/,40,39,38,37 /*Arrow Keys*/,17,16,9 /*Ctrl,Shift,Tab*/];

	var DTimePicker = function(elem, options){
		var that = this;
		this.input = $(elem);
		this.activeField = DTimePicker.HOUR;
		this.picker = null;

		this.hour = $('<input class="tp_hr" type="text" style="width:16px;" maxlength="2">');
		this.min = $('<input class="tp_min" type="text" style="width:16px;" maxlength="2">');
		this.ampm = $('<input class="tp_am_pm" type="text" maxlength="2" style="width:25px;">');

		if(options.time){
			var h = parseInt(options.time.substr(0, 2)), m = parseInt(options.time.substr(3, 2));

			//Set values of hour, minute and AM/PM inputs
			this.ampm.val((parseInt(h) > 12 ? "PM" : "AM"));
			this.min.val(m>10?m:"0"+m);
			h = (h > 12 ? h-12 : h);
			this.hour.val(h>10?h:"0"+h);

			//Set value of anchor input
			this.setValue();
		}

		//Attach event listeners to inputs
		this.hour.on('focus', function () {
			$(this).select();
			that.activeField = DTimePicker.HOUR;
		}).on('blur', function (e) {
			var val = parseInt($(this).val());
			if(val > MAX_HOUR) $(this).val(MAX_HOUR);
			if(val < 10 && val > 0) $(this).val("0"+val);
			that.setValue();
		}).on('keydown', function (e) {
			if(ACCEPTABLE_KEYS.indexOf(e.keyCode)<0) return false;
		}).on('keyup', function (e) {
			if (e.keyCode == 40){ //Arrow Down/Up button
				that.spinDown();
			} else if(e.keyCode == 38) {
				that.spinUp();
			}
		});
		this.min.on('focus', function () { 
			$(this).select();
			that.activeField = DTimePicker.MIN; 
		}).on('blur', function (e) {
			var val = parseInt($(this).val());
			if(val > MAX_MIN) $(this).val(MAX_MIN);
			if(val < 10 && val > 0) $(this).val("0"+val);
			that.setValue();
		}).on('keydown', function (e) {
			if(ACCEPTABLE_KEYS.indexOf(e.keyCode)<0) return false;
		}).on('keyup', function (e) {
			if (e.keyCode == 40){ //Arrow Down/Up button
				that.spinDown();
			} else if(e.keyCode == 38) {
				that.spinUp();
			}
		});
		this.ampm.on('keydown', function (e) {
			if(e.keyCode == 80) { //P button
				$(this).val("PM").select();
				that.setValue();
			} else if (e.keyCode == 65){ //A button
				$(this).val("AM").select();
				that.setValue();
			} else if (e.keyCode == 40 || e.keyCode == 38){ //Arrow Down/Up button
				that.activeField = DTimePicker.AMPM;
				that.adjustTime(null);
			} else if(e.keyCode == 16 || e.keyCode == 9) { return true; }
			return false;
		}).on('focus', function () { $(this).select(); that.activeField = DTimePicker.AMPM; });

		this.spinnerDiv = $('<div class="tp_spinners"></div>');
		this.spinUpBtn = $('<span class="tp_spinup"></span>');
		this.spinDownBtn = $('<span class="tp_spindown"></span>');

		//Attache event listeners to spinners
		this.spinUpBtn.on('click', function (e) { that.spinUp(); });
		this.spinDownBtn.on('click', function (e) { that.spinDown(); });

		this.create();
	}

	DTimePicker.prototype = {

		constructor : DTimePicker, 

		create : function(){
			var that = this;
			that.input.wrap('<div class="tp"></div>');
			that.input.hide();

			that.picker = that.input.parent();

			that.picker.append(that.hour).append(":").append(that.min).append(" ").append(that.ampm).append(" ");

			that.spinnerDiv.append(that.spinUpBtn).append(that.spinDownBtn).appendTo(that.picker);
		},

		spinUp : function () { this.adjustTime('p'); },

		spinDown : function () { this.adjustTime('m'); },

		adjustTime : function (op) {
			var that = this;
			switch(this.activeField){
				case DTimePicker.HOUR:
					var val = parseInt(that.hour.val()),
						limit = (op=='p'? MAX_HOUR : 1);
						val = (op=='p'? val+1 : val-1);

					if((op=='p'?(val<=limit):(val>=limit))) { that.hour.val((val<10?"0"+val:val)).select(); }
				break;
				case DTimePicker.MIN:
					var val = parseInt(that.min.val()),
						limit = (op=='p'? MAX_MIN : 0);
						val = (op=='p'? val+1 : val-1);

					if((op=='p'?(val<=limit):(val>=limit))) { that.min.val((val<10?"0"+val:val)).select(); }
				break;
				case DTimePicker.AMPM:
					var val = that.ampm.val();
					that.ampm.val((val=='AM'? "PM" : "AM")).select();
				break;
			}
			this.setValue();
		},

		setValue : function () {
			var ap = this.ampm.val(), h = this.hour.val(), m = this.min.val();
			if(ap=="PM") h=parseInt(h)+12;
			var val = h+":"+m+":00.000";
			this.input.attr('value', val);
		}
	}

	DTimePicker.HOUR = 1;
	DTimePicker.MIN = 2;
	DTimePicker.AMPM = 3;

	/* DEFINITION FOR TIME PICKER */
	$.fn.timepicker = function(opts){
		return $(this).each(function(){
 			var $this = $(this),
 				data = $(this).data('dtimepicker'),
 				options = $.extend({}, $.fn.timepicker.defaults, $this.data(), typeof opts == 'object' && opts);
 			if(!data){
 				$this.data('dtimepicker', (data = new DTimePicker(this, options)));
 			}
 			if(typeof opts == 'string') data[opts]();
		});
	}

	$.fn.timepicker.defaults = {
 		time: '12:00:00.000',
 	}

	$.fn.timepicker.Constructor = DTimePicker;

})(jQuery);