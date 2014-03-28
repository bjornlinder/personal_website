	
	<!--
		 #<%Post.each do |post|%>
	<div class="post">
		
		<%if post.preview_media?#add another column for this%>
		<div class="post-img picture"><a href="images/sudo-sandwich.png" rel="image" title="Sudo-Samich"><img src="images/sudo-sandwich.png" alt="" /></a></div>
		<%end%>
		
		<%="<a href='/blog/#{post.path}'"%> class="post-icon standard"></a>
		<div class="post-content">
			<div class="post-title"><h2><a href="/blog/introducing-comments"><%="#{post.title}"%></a></h2></div>
			<div class="post-meta"><span><i class="mini-ico-calendar"></i><%="#{post.date_created}"%></span> <span><i class="mini-ico-user"></i>By <a href="#">Bjorn</a></span></div>
		<div class="post-description">
<br><br>
<p>	<%=post.short%>
</p></div>
		<%="a class=\"post-entry\" href=\"/blog/#{post.path}"%>Continue Reading</a>
		</div>
	</div>		
	
	#<%end%> 
		-->
		
		
		
	  @blog_data["pre-work.html"] = ["Launch Academy: Reflection on Pre-Work", "On Feb 16, 2014"]
	  @blog_data["first-post.html"] = ["First Blog Post", "Jan 1, 2014", "images/comic.gif"]
	  @blog_data["launch-academy-week-1.html"] = ["Launch Academy : Week 1", "Feb 22, 2014", "images/sudo-sandwich.png"]
	  @blog_data["project-updates.html"] = ["Programming Updates - Sinatra & Other Projects", "Mar 3, 2014"]
	  @blog_data["test-driven-development.html"] = ["Test Driven Development", "Mar 9, 2014"]
		
		
		Post.create(title: "Launch Academy: Reflection on Pre-Work", path: "pre-work.html", allow_comments: false, date_created: Date.parse("Feb 16, 2014"))
		Post.create(title: "First Blog Post", path: "first-post.html", media: "images/comic.gif", allow_comments: false, preview_media: "images/comic.gif", date_created: Date.parse("Jan 1, 2014"))
		Post.create(title: "Launch Academy : Week 1", path: "launch-academy-week-1.html", allow_comments: false, media: "images/sudo-sandwich.png", preview_media: "images/sudo-sandwich.png", date_created: Date.parse("Feb 22, 2014"))
		Post.create(title: "Programming Updates - Sinatra & Other Projects", path: "project-updates.html", allow_comments: false, date_created: Date.parse("Mar 3, 2014"))
		Post.create(title: "Test Driven Development", path: "test-driven-development.html", allow_comments: false, date_created: Date.parse("Mar 9, 2014"))
		
		

	  @blog_data = {}
	  @blog_data["pre-work.html"] = ["Launch Academy: Reflection on Pre-Work", "On Feb 16, 2014"]
	  @blog_data["first-post.html"] = ["First Blog Post", "Jan 1, 2014", "images/comic.gif"]
	  @blog_data["launch-academy-week-1.html"] = ["Launch Academy : Week 1", "Feb 22, 2014", "images/sudo-sandwich.png"]
	  @blog_data["project-updates.html"] = ["Programming Updates - Sinatra & Other Projects", "Mar 3, 2014"]
	  @blog_data["test-driven-development.html"] = ["Test Driven Development", "Mar 9, 2014"]