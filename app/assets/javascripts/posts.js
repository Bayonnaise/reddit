<script src="//js.pusher.com/2.2/pusher.min.js" type="text/javascript"></script>

var pusher = new Pusher('b39d1e4975d7aaf699c3');
var channel = pusher.subscribe('reddit');

channel.bind('new_post', function(data) {
		alert("Test");
	);
};

