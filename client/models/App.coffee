#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # way to not use parens?
    player = @get 'playerHand'
    player.on 'stand', -> @trigeer 'stand'
    player.on 'bust', => @trigger 'lose'
    player.on 'win', => @trigger 'win'
  #check on bust
  #react to stand

