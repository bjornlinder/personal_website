	
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
		
		
		# Believe it or not, we're halfway through! Hopefully, you've learned a lot and we've helped you along the way.
		# 
		# What part of the program has been particularly eye opening? What is your favorite aspect of web development and software development so far?
		# 
		# Write a blog article about your breakable toy. Discuss why you chose it, what gets you excited, and where you envision you might be challenged technically. Feel free to share some of your user stories and/or wireframes as part of the article. Remember, the idea of reflection is to cement your learning and to share how quickly that learning is progressing with the world.
    

    <div class="container">

    	<div class="sixteen columns">
    		<section class="slider">
    			<div class="flexslider home">
    				<ul class="slides">
    					<li>
    	<iframe src='http://embed.verite.co/timeline/?source=0AkedbV-iFTU_dDJpODluR1N6LUVzQW5VSVBEbHh5Ymc&font=Bevan-PotanoSans&maptype=toner&lang=en&height=650' width='100%' height='650' frameborder		='0'></iframe>
    					</li>
    				</ul>
    			</div>
    		</section>
      	</div>
    </div>