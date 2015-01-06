$(function(){ 
	$('.btn-warning').click(function(){
			var posterGender = $('#authorgender').val();
			// console.log(posterGender);
			var posterAge = $('#authorage').val();
			// console.log(posterAge);
			var subscribers = $('#subscribers').val();
			// console.log(subscribers);
			var monthlyViews = $('#monthlyviews').val();
			// console.log(monthlyViews);
			var audienceGender = $('#audiencegender').val();
			// console.log(audienceGender);
			var audienceAge = $("#audienceage").val();
			// console.log(audienceAge);
			var audienceLocation = $("#audiencelocation").val();
			// console.log(audienceLocation);
			var posterLocation = $("#authorlocation").val();
			// console.log(posterLocation);
			var genre = $("#genre").val();
			// console.log(genre);
			$.ajax({
				type: "GET",
				url: "/youtube",
				data: {
					posterGender: posterGender,
					posterAge: posterAge,
					subscribers: subscribers,
					monthlyViews: monthlyViews,
					audienceGender: audienceGender,
					audienceAge: audienceAge,
					audienceLocation: audienceLocation,
					posterLocation: posterLocation,
					genre: genre
				}
			})
			$.ajax({
				type: "GET",
				url: "/youtube"
			}).done(function(data){
				console.log("here")
				var div = document.createElement("div");
				var p_published = document.createElement("p");
				var p_updated = document.createElement("p");
				var p_video_title = document.createElement("p");
				var p_author_name = document.createElement("h1");
				$(div).addClass("col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1")
				document.body.appendChild(div);
				document.body.appendChild(p_published);
				document.body.appendChild(p_author_name);
				document.body.appendChild(p_updated)
				document.body.appendChild(p_video_title)

				author_name = document.createTextNode(data[0].author_name)
				published = document.createTextNode("Published:" + " " + data[0].published)
				updated = document.createTextNode("Updated:" + " " + data[0].updated)
				video_title = document.createTextNode("Video Title:" + " " + data[0].video_title)

				p_author_name.appendChild(author_name)
				p_published.appendChild(published)
				p_updated.appendChild(updated)
				p_video_title.appendChild(video_title)


				div.appendChild(p_author_name)
				div.appendChild(p_video_title)
				div.appendChild(p_published)
				div.appendChild(p_updated)
			}).fail(function(data){
				console.log("failed")
			})
		})
	})


