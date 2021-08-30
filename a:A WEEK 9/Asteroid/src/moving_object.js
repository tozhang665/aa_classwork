function MovingObject(options){
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx){
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true);
  ctx.fillStyle = this.color;
  ctx.fill();
}


MovingObject.prototype.move = function(){
  this.pos[0] = this.pos[0] + this.vel[0];
  this.pos[1] = this.pos[1] + this.vel[1];

  this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function(otherObject){
  let difference = [this.pos[0] - otherObject.pos[0],this.pos[1] - otherObject.pos[1]];

  let hyp = Math.sqrt((difference[0]**2) + (difference[1] **2));
  let radSum = this.radius + otherObject.radius;

  if(radSum >= hyp){
    return true;
  }else{
    return false;
  }

}

module.exports = MovingObject;