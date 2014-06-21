class window.CardView extends Backbone.View

  className: 'card'
    
  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    # @$el.html @template @model.attributes
    # @$el.attr('style', 'background-image: ' + @test @model.attributes)
    @$el.css 'background-image', "url(\"img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png\")"
    @$el.css 'background-image', "url(\"img/card-back.png\")" unless @model.get 'revealed'
