// console.log("Webpack is working!")

// const MovingObject = require("./moving_object");
const Asteroid = require("./asteroid");
const GameView = require("./game_view");
const Game = require("./game");
// const Util = require("./utils");

// window.MovingObject = MovingObject;
window.Asteroid = Asteroid;



document.addEventListener("DOMContentLoaded",function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 1000;
  canvasEl.height = 1000;
  const ctx = canvasEl.getContext("2d");
  const game = new Game();
  console.log(game);
  // const ast = new Asteroid({
  //   pos: [300, 400]
  // });

  // ast.draw(ctx);
  const gameview = new GameView(game,ctx).start();
  // console.log(gameview);
  // gameview.start();
})
// console.log(util);
// console.log(MovingObject);