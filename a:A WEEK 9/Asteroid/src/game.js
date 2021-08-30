const Asteroid = require("./asteroid");
const Ship = require("./ship");

function Game(){
  this.DIM_X = 1000;
  this.DIM_Y = 1000;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.ship = new Ship({ pos: this.randomPosition(), game: this});
  for(let i = 0; i < this.NUM_ASTEROIDS ; i++){
    this.addAsteroids();
  }
}

Game.prototype.addAsteroids = function() {
  this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}));
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
  this.allObjects().forEach((ele) => {
    ele.draw(ctx);
  });
}

Game.prototype.moveObjects = function(){
  this.allObjects().forEach((ele) =>{
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


Game.prototype.checkCollisions = function( ){
  for(let i = 0; i < this.asteroids.length; i++){
    if(this.asteroids[i].isCollidedWith(this.ship)) {
        this.ship.relocate();
    }
  }
}

Game.prototype.step = function(){
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  let asteroidIndex = this.asteroids.indexOf(asteroid);
  return this.allObjects().splice(asteroidIndex, 1);
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]);
}


module.exports = Game;