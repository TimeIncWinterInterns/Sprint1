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
			}).done(function(data){
				console.log(data)
				console.log(data.length)
				console.log("here")
				$('div#information').empty();
				for(i=0; i < data.length; i++){
					var p_published = document.createElement("p");
					var p_updated = document.createElement("p");
					var p_video_title = document.createElement("p");
					var p_author_name = document.createElement("h1");
					var p_video_url = document.createElement("p");
					var p_redirect_page = document.createElement("p");

					document.body.appendChild(p_published);
					document.body.appendChild(p_author_name);
					document.body.appendChild(p_updated);
					document.body.appendChild(p_video_title);
					document.body.appendChild(p_video_url);
					document.body.appendChild(p_redirect_page);

					author_name = document.createTextNode(data[i].author_name)
					published = document.createTextNode("Published:" + " " + data[i].published)
					updated = document.createTextNode("Updated:" + " " + data[i].updated)
					video_title = document.createTextNode("Video Title:" + " " + data[i].video_title)
					video_url = document.createTextNode("Video URL:" + " " + data[i].video_url)
					redirect_page = document.createTextNode("Redirect Page:" + " " + data[i].redirect_page)

					p_author_name.appendChild(author_name)
					p_published.appendChild(published)
					p_updated.appendChild(updated)
					p_video_title.appendChild(video_title)
					p_video_url.appendChild(video_url)
					p_redirect_page.appendChild(redirect_page)


					$('div#information').append(p_author_name)
					$('div#information').append(p_video_title)
					$('div#information').append(p_published)
					$('div#information').append(p_updated)
					$('div#information').append(p_video_url)
					$('div#information').append(p_redirect_page)
				}
			}).fail(function(data){
				console.log("failed")
			})
		})
})

