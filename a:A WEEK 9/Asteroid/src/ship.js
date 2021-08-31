const MovingObject = require("./moving_object");

const Util = require("./utils");

function Ship(options) {
    options.color = options.color || "red";
    options.radius = options.radius || 15;
    options.vel = Util.randomVec(0);
    // options.vel = [0,0];
    MovingObject.call(this, options);
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function(){
    this.pos = this.game.randomPosition();
    this.vel = Util.randomVec(0);
}

Ship.prototype.power = function(arr){
  this.vel[0] = this.vel[0] + arr[0];
  this.vel[1] = this.vel[1] + arr[1];
}

module.exports = Ship;