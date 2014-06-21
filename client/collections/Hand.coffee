class window.Hand extends Backbone.Collection
# some buggy logic here
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @scores()[0] > 21
      @trigger 'bust', @
    do @play

  stand: =>
    @trigger 'stand'

  play: ->
    if @isDealer and @scores()[0] <= 21
      if @scores()[0] < 17
        do @hit
      else
        do @stand

  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce and ((score + 10) <= 21) then [(score + 10)] else [score]
