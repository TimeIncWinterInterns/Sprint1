$(function(){ 
	$('.btn-warning').click(function(){
		var posterGender = $('#authorgender').val();
		console.log(posterGender);
		var posterAge = $('#authorage').val();
		console.log(posterAge);
		var subscribers = $('#subscribers').val();
		console.log(subscribers);
		var monthlyViews = $('#monthlyviews').val();
		console.log(monthlyViews);
		var audienceGender = $('#audiencegender').val();
		console.log(audienceGender);
		var audienceAge = $("#audienceage").val();
		console.log(audienceAge);
		var audienceLocation = $("#audiencelocation").val();
		console.log(audienceLocation);
		var posterLocation = $("#authorlocation").val();
		console.log(posterLocation);
		var genre = $("#genre").val();
		console.log(genre);
		$.ajax({
			type: "GET",
			url: "http://gdata.youtube.com/feeds/api/videos?q="+ genre +"&max-results=10&v=2&&key=AIzaSyAvkL7_sQDpLa1g86QL7K4yaEkiV_OGBKc"
		}).done(function(data){
			console.log(data)
			for (i = 16; i< 25; i++){
				nameTag = data.children[0].children[i].children[14].children[0]
				console.log(nameTag)
				authorName = $(nameTag).text()
				console.log(authorName)
				published = data.children[0].children[i].children[1].firstChild["data"];
				updated = data.children[0].children[i].children[2].firstChild["data"];
				console.log(published)
				console.log(updated)
				videoTitle =data.children[0].children[i].children[5].innerHTML
				console.log(videoTitle)
				videoUrl = $(data.children[0].children[i].children[6]).attr('src')
				console.log(videoUrl)
			}
				$.ajax({
					type: "GET",
					url: "/youtube",	
					data: {
						nameTag: nameTag,
						authorName: authorName,
						published: published,
						updated: updated,
						videoTitle: videoTitle,
						videoUrl: videoUrl
					}
				}).done(function(){
					console.log("here")
				}).fail(function(){
				console.log("failed")
				})
			})
		})

