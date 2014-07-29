class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # way to not use parens?
    player = @get 'playerHand'
    dealer = @get 'dealerHand'

    player.on 'bust', => @trigger 'lose'

    player.on 'stand', =>
      dealer.at(0).flip()
      do dealer.play

    dealer.on 'bust', => @trigger 'win'

    dealer.on 'stand', =>
      pTotal = player.scores()[0]
      dTotal = dealer.scores()[0]
      if dTotal > pTotal
        @trigger 'lose'
      else if pTotal > dTotal
        @trigger 'win'
      else
        @trigger 'push'

