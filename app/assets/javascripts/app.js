$(function(){ 
	$('.btn-warning').click(function(){
		var posterGender = $('#authorgender').val();
		//console.log(posterGender);
		var posterAge = $('#authorage').val();
		//console.log(posterAge);
		var subscribers = $('#subscribers').val();
		//console.log(subscribers);
		var monthlyViews = $('#monthlyviews').val();
		//console.log(monthlyViews);
		var audienceGender = $('#audiencegender').val();
		//console.log(audienceGender);
		var audienceAge = $("#audienceage").val();
		//console.log(audienceAge);
		var audienceLocation = $("#audiencelocation").val();
		//console.log(audienceLocation);
		var authorLocation = $("#authorlocation").val();
		//console.log(authorLocation);
		var genre = $("#genre").val();
		//console.log(genre);
		$.ajax({
			type: 'GET',
			url: '/information',
			data: {
				posterGender: posterGender,
				posterAge: posterAge,
				genre: genre/*,
				audienceLocation: audienceLocation*/
			},
			success: function(data){
				console.log(data);
				//$(location).attr('href','/information');	
			},
			fail: function() {
				console.log("error");
			}
		})/*.done(function(data){
			console.log("done");
			$(location).attr('href','/information');
		}).fail(function() {
			console.log("error");
		})*/
		/*$.ajax({
			url: "http://gdata.youtube.com/feeds/api/videos?q="+ genre +"&max-results=10&v=2&dimensions=age"+posterAge+","+posterGender+","+authorLocation+"&prettyprint=true&metrics="+subscribers+'"'
		}).done(function(data){
			var nameTag = data.children[0].children[16].children[12].children[0]
			var authorName = $(nameTag).text()
			console.log(authorName)
			var published = data.children[0].children[16].children[1].firstChild["data"];
			var updated = data.children[0].children[16].children[2].firstChild["data"];
			console.log(published)
			console.log(updated)
			var videoTitle =data.children[0].children[16].children[6].innerHTML
			console.log(videoTitle)
			var videoUrl = $(data.children[0].children[16].children[7]).attr('src')
			//console.log(videoUrl)
			$.ajax({
				type: 'GET',
				url: '/information',
				data: {
					authorName: authorName,
					published: published,
					updated: updated,
					videoTitle: videoTitle
				},
				success: function(data){
					console.log(data);
					$(location).attr('href','/information');	
				},
				fail: function() {
					console.log("error");
				}
			}).done(function(data){
				//console.log(data);
				//$(location).attr('href','/information');
			}).fail(function() {
				//console.log("error");
			})
		})*/
	})
})

