// Generated by CoffeeScript 1.7.1
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.Hand = (function(_super) {
  __extends(Hand, _super);

  function Hand() {
    this.stand = __bind(this.stand, this);
    return Hand.__super__.constructor.apply(this, arguments);
  }

  Hand.prototype.model = Card;

  Hand.prototype.initialize = function(array, deck, isDealer) {
    this.deck = deck;
    this.isDealer = isDealer;
  };

  Hand.prototype.hit = function() {
    this.add(this.deck.pop()).last();
    if (this.scores()[0] === 21) {
      this.trigger('win', this);
    } else if (this.scores()[0] > 21) {
      this.trigger('bust', this);
    }
    return this.play();
  };

  Hand.prototype.stand = function() {
    return this.trigger('stand');
  };

  Hand.prototype.play = function() {
    if (this.isDealer) {
      if (this.scores()[0] < 17 || this.scores()[1] < 17) {
        return this.hit();
      } else {
        return this.stand();
      }
    }
  };

  Hand.prototype.scores = function() {
    var hasAce, score;
    hasAce = this.reduce(function(memo, card) {
      return memo || card.get('value') === 1;
    }, false);
    score = this.reduce(function(score, card) {
      return score + (card.get('revealed') ? card.get('value') : 0);
    }, 0);
    if (hasAce) {
      return [score, score + 10];
    } else {
      return [score];
    }
  };

  Hand.prototype.highest = function() {
    if (this.scores().length === 1) {
      return this.scores()[0];
    } else {
      if (this.scores()[0] > this.scores()[1]) {
        return this.scores()[0];
      } else {
        return this.scores()[1];
      }
    }
  };

  return Hand;

})(Backbone.Collection);
