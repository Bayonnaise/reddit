$(document).ready(function() {
	$('.vote-link').on('click', function(event) {
		var voteCount = $(this).siblings('.vote-count');
		event.preventDefault();
		$.post(this.href, function(response) {
			voteCount.text(response.new_count);
		});
	});
});