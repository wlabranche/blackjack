#todo: refactor to have a game beneath the outer blackjack model
# this is done I think
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # way to not use parens?
    player = @get 'playerHand'
    dealer = @get 'dealerHand'

    player.on 'bust', => @trigger 'lose'
    player.on 'win', => @trigger 'win'

    player.on 'stand', =>
      dealer.at(0).flip()
      do dealer.play

    dealer.on 'bust', => @trigger 'win'

    dealer.on 'stand', =>
      pTotal = player.highest();
      dTotal = dealer.highest();
      if dTotal > pTotal
        @trigger 'lose'
      else if pTotal > dTotal
        @trigger 'win'
      else
        @trigger 'push'

