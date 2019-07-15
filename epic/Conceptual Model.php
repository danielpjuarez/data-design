<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Conceptual Model</title>
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
	<h3>
		Conceptual Model for Reddit Database
	</h3>
	<h4>Entities and Attributes</h4>
		<h5>Profile</h5>
		<ul>
			<li>
				profileId (primary key)
			</li>
			<li>profileHandle</li>
			<li>profileUsername</li>
			<li>profileHash</li>
		</ul>
		<h5>Subreddits</h5>
		<ul>
			<li>subredditId (primary key)</li>
			<li>subredditName</li>
		</ul>
		<h5>Subscriptions</h5>
		<ul>
			<li>subscriptionProfileId (foreign key)</li>
			<li>subscriptionSubredditId (foreign key)</li>
					</ul>
	<h4>Relations</h4>
		<ul>
			<li>One profile can optionally have many subscriptions (1 to n)</li>
			<li>One subreddit can optionally have many subscriptions (1 to n)</li>
		</ul>
	<img src="images/Conceptual_Model.jpg" alt="redditERD" title="reddit conceptual model">
	<br>
	<a href="index.php">Directory</a>
	</body>
</html>