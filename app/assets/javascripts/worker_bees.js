document.addEventListener("turbolinks:load", function() {
	Highcharts.chart('container', {

	    title: {
	        text: 'PollenGlob Production vs Nectar Consumption'
	    },

	    xAxis: {
	        type: 'datetime',
	        title: {
	            text: 'Date'
	        }
	    },

	    yAxis: [{ 
	        labels: {
	            format: '{value} p/g',
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        },
	        title: {
	            text: 'PollenGlob Production',
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        }
	    }, { 
	        title: {
	            text: 'Nectar Consumption',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        labels: {
	            format: '{value} units',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        opposite: true
	    }],

	    tooltip: {
	        shared: true
	    },

	    legend: {
	        layout: 'vertical',
	        align: 'left',
	        x: 120,
	        verticalAlign: 'top',
	        y: 100,
	        floating: true,
	        backgroundColor:
	            Highcharts.defaultOptions.legend.backgroundColor || // theme
	            'rgba(255,255,255,0.25)'
	    },
	    
	    series: [{
	        name: 'PollenGlobs',
	        type: 'column',
	        data: gon.pollen_globs,
	        tooltip: {
	            valueSuffix: 'p/g'
	        }
	    }, {
	        name: 'Nectar',
	        type: 'spline',
	        yAxis: 1,
	        data: gon.nectars,
	        tooltip: {
	            valueSuffix: 'units'
	        }
	    }]
	});
});