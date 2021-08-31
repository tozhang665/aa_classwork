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
    this.bindKeyHandlers();
    // console.log("running");
  },20);
}

// GameView.prototype.bindKeyHandlers = function(){
//   // if(key.isPressed("a",this.game.ship.power([0,-1])));
//   // key('w', this.game.ship.power([0,-1]));
//   // key('a', this.game.ship.power([-1,0]));
//   // key('s', this.game.ship.power([0,1]));
//   // key('d', this.game.ship.power([1,0]));
//   const ship = this.ship;

//   Object.keys(GameView.MOVES).forEach(function(k)  {
//     const move = GameView.MOVES[k];
//     key(k, function () { ship.power(move); });
//   });

// }

GameView.MOVES = {
  w: [0, -1],
  a: [-1, 0],
  s: [0, 1],
  d: [1, 0],
};

GameView.prototype.bindKeyHandlers = function bindKeyHandlers() {
  const ship = this.game.ship;

  Object.keys(GameView.MOVES).forEach(function(k)  {
    const move = GameView.MOVES[k];
    key(k, function () { ship.power(move); });
  });

  // key("space", function () { ship.fireBullet(); });
};
module.exports = GameView;
