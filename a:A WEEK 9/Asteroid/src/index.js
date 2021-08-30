// console.log("Webpack is working!")

const MovingObject = require("./moving_object");
// const Util = require("./utils");

window.MovingObject = MovingObject;


document.addEventListener("DOMContentLoaded",function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 500;
  canvasEl.height = 500;
  const ctx = canvasEl.getContext("2d");

  const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#000000"});

  // for(let i = 0; i < 10000;i++){
    mo.draw(ctx);
    mo.move();
  // }

})
// console.log(util);
// console.log(MovingObject);