console.log('we got featuredBeerView');

var FeaturedBeerView = Backbone.View.extend({
	tagName: 'div',
	className: 'featured-beer',
	initialize: function() {
		this.render();
	},
	template: _.template($("#featured-beer-template").html()),
	render: function() {
		this.$el.html(this.template(featuredBeer.toJSON()));
		$('#featured-beer').prepend(this.$el);
		return this;
	}
});

// <%= image_tag(<%%= label %>, class: "featured-label") %>
