const Game = require("./game")

function GameView(game,ctx){
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function(){
  // const game = this.game;
  // const context = this.ctx;
  setInterval(()=>{
    // console.log(this)
    this.game.step();
    this.game.draw(this.ctx);
    // console.log("running");
  },20);
}

module.exports = GameView;
