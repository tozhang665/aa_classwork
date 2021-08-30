// console.log("Webpack is working!")

// const MovingObject = require("./moving_object");
const Asteroid = require("./asteroid");
// const Util = require("./utils");

// window.MovingObject = MovingObject;
window.Asteroid = Asteroid;


document.addEventListener("DOMContentLoaded",function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 500;
  canvasEl.height = 500;
  const ctx = canvasEl.getContext("2d");

  // const mo = new MovingObject({
  // pos: [30, 30],
  // vel: [10, 10],
  // radius: 5,
  // color: "#000000"});

  // // for(let i = 0; i < 10000;i++){
  //   mo.draw(ctx);
  //   mo.move();
  // }

  const ast = new Asteroid({
    pos: [30, 30]
  });

  ast.draw(ctx);

})
// console.log(util);
// console.log(MovingObject);