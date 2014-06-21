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
      # if @scores().length == 1
      if @scores()[0] < 17
        do @hit
      else
        do @stand
      # else
      #   if @scores()[0] < 17 # and @scores()[1] < 17
      #     do @hit
      #   else
      #     do @stand
          
  blackJack: -> 
    if do @scores[0] is 21
      @trigger 'blackjack', @

  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce and ((score + 10) <= 21) then [(score + 10)] else [score]



  ###
  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
###

  # highest: ->
  #   if @scores().length is 1
  #     @scores()[0]
  #   else
  #     if @scores()[1] <= 21 # @scores()[0] > @scores()[1] and 
  #       @scores()[1]
  #     else
  #       @scores()[0] 

