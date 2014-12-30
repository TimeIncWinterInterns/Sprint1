  $(function() {
    $("#slider-range").slider({
      range: true,
      min: 0,
      max: 100,
      values: [ 0, 100 ],
      slide: function( event, ui ) {
        $( "#authorage" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#authorage" ).val($("#slider-range" ).slider( "values", 0 ) + " - " + $("#slider-range" ).slider( "values", 1 ) );
  });

    $(function() {
    $("#slider-range2").slider({
      range: true,
      min: 0,
      max: 100000,
      values: [ 0, 100000 ],
      slide: function( event, ui ) {
        $( "#subscribers" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#subscribers" ).val($("#slider-range2" ).slider( "values", 0 ) + " - " + $("#slider-range2" ).slider( "values", 1 ) + "+");
  });

    $(function() {
    $("#slider-range3").slider({
      range: true,
      min: 0,
      max: 100000,
      values: [ 0, 100000 ],
      slide: function( event, ui ) {
        $( "#monthlyviews" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#monthlyviews" ).val($("#slider-range3" ).slider( "values", 0 ) + " - " + $("#slider-range3" ).slider( "values", 1 ) + "+");
  });

        $(function() {
    $("#slider-range4").slider({
      range: true,
      min: 0,
      max: 100,
      values: [ 0, 100 ],
      slide: function( event, ui ) {
        $( "#audienceage" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    });
    $( "#audienceage" ).val($("#slider-range4" ).slider( "values", 0 ) + " - " + $("#slider-range4" ).slider( "values", 1 ) );
  });