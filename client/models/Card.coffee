class window.Card extends Backbone.Model

  #set the cards value
  initialize: (params) ->
    @set
      revealed: true
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank
  
  #flip the card, on really matters to the dealer 
  flip: ->
    @set 'revealed', !@get 'revealed'
    @
#seems complete, all cards can do/need to do is have a value and flip;