console.log('we got addDrinkView')

var addDrinkView = Backbone.View.extend({
	tagName: 'div',
	className: 'add-drink-button',
	template: _.template($('#add-drink-template').html()),
	initialize: function() {
		this.on('click', this.render());
	},
	render: function() {
		this.$el.html(this.template());
		$('#add-drink').prepend(this.$el);
		return this;
	}
});