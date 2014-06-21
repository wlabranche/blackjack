class window.CardView extends Backbone.View

  className: 'card'
  style: 'backgroung-image: url(<%= rankName %>-<%= suitName %>.png)'
  # check handView for this //'<%= rankName %> of <%= suitName %>' #
  # console.log(@model);
  # card: @model.get 'rankName' #.get(rankName).toLowerCase() + '-' + suitName.toLowerCase() + '.png'
  # '<div class="card" style="background-image: url(../img/cards/' + card + '"></div>' 
  template: _.template '<%= rankName %> of <%= suitName %>'
  test: _.template "url('../img/cards/<%= rankName %>-<%= suitName %>.png')"

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    # @$el.html @template @model.attributes
    # @$el.attr('style', 'background-image: ' + @test @model.attributes)
    @$el.css 'background-image', "url(\"img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png\")"
    @$el.css 'background-image', "url(\"img/card-back.png\")" unless @model.get 'revealed'
