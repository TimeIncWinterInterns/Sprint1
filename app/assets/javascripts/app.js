$(function(){ 
	$('.btn-danger').click(function(){
		var posterGender = $('#authorgender').val();
		// console.log(posterGender);
		var posterAge = $('#authorage').val();
		// console.log(posterAge);
		var subscribers = $('#subscribers').val();
		// console.log(subscribers);
		var views = $('#views').val();
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
				views: views,
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
				var p_published = $("<p></p>");
				var p_updated = $("<p></p>");
				var p_video_title = $("<h4></h4>");
				var p_author_name = $("<h2></h2>");
				var p_video_url = $("<p></p>");
				var p_redirect_page = $("<p></p>");
				var video_link = $("<a></a>");
				var video_tag = $("<object></object>")
				var p_number_of_likes = $("<p></p>")
				var p_number_of_dislikes = $("<p></p>")

				video_tag.attr('width', "420")
				video_tag.attr('height', "315")
				video_tag.attr('data', data[i].video_url)
				video_link.attr('href', data[i].redirect_page)
				video_link.attr('target', '_blank')

				author_name = document.createTextNode("Author Name: "+ data[i].author_name)
				published = document.createTextNode("Published:" + " " + data[i].published)
				updated = document.createTextNode("Updated:" + " " + data[i].updated)
				video_title = document.createTextNode("Video Title: " + data[i].video_title)
				video_url = document.createTextNode("Video:")
				redirect_page = document.createTextNode("Redirect Page: ")
				video_link_text = document.createTextNode(data[i].redirect_page)
				number_of_likes = document.createTextNode("Number of Likes: " + data[i].number_of_likes)
				number_of_dislikes = document.createTextNode("Number of Dislikes: " + data[i].number_of_dislikes)

				$(p_author_name).append(author_name)
				$(p_published).append(published)
				$(p_updated).append(updated)
				$(p_video_title).append(video_title)
				$(video_tag).append(video_url)
				$(p_redirect_page).append(redirect_page)
				$(video_link).append(video_link_text)
				$(p_redirect_page).append(video_link)
				$(p_number_of_likes).append(number_of_likes)
				$(p_number_of_dislikes).append(number_of_dislikes)

				$('div#information').append(video_tag)
				$('div#information').append(p_author_name)
				$('div#information').append(p_video_title)
				$('div#information').append(p_published)
				$('div#information').append(p_updated)
				$('div#information').append(p_redirect_page)
				$('div#information').append(p_number_of_likes)
				$('div#information').append(p_number_of_dislikes)
			}
		}).fail(function(data){
			console.log("failed")
		})
	})
})