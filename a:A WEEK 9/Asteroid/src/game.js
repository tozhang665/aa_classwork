const Asteroid = require("./asteroid");

function Game(){
  this.DIM_X = 1000;
  this.DIM_Y = 1000;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  for(let i = 0; i < this.NUM_ASTEROIDS ; i++){
    this.addAsteroids();
  }
}

Game.prototype.addAsteroids = function(){
  this.asteroids.push(new Asteroid({pos: this.randomPosition(),game: this}));
}

Game.prototype.randomPosition = function(){
  let x = Math.random() * this.DIM_X;
  let y = Math.random() * this.DIM_Y;
  return [x,y];
}

Game.prototype.draw = function(ctx){
  // console.log("hi");
  ctx.clearRect(0,0,this.DIM_X,this.DIM_Y);
  ctx.fillStyle = "#000000"
  this.asteroids.forEach((ele) => {
    ele.draw(ctx);
  });
}

Game.prototype.moveObjects = function(){
  this.asteroids.forEach((ele) =>{
    ele.move();
  });

}

Game.prototype.wrap = function(pos){
  let x = pos[0];
  let y = pos[1];
  if(x > 1000){
    x = 1;
  }
  if(y > 1000){
    y = 1;
  }
  if(x < 0){
    x = 999;
  }
  if(y < 0){
    y = 999;
  }
  return [x,y];
}


Game.prototype.checkCollisions = function(){
// [0,1,2,3,4]
// [4,5]
  for(let i = 0; i < this.NUM_ASTEROIDS; i++){
    for(let j = i+1; j < this.NUM_ASTEROIDS;j++){
      if(this.asteroids[i].isCollidedWith(this.asteroids[j])){
        alert("COLLISION");
      }
    }
  }
}

Game.prototype.step = function(){
  this.moveObjects();
  this.checkCollisions();
}


module.exports = Game;