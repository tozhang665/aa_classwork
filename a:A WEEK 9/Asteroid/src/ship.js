const MovingObject = require("./moving_object");
const Game = require("./game");
const Util = require("./utils");

function Ship(options) {
    options.color = options.color || "red";
    options.radius = options.radius || 15;
    options.vel = Util.randomVec(0);
    // options.vel = [0,0];
    MovingObject.call(this, options);
}

Ship.prototype.relocate = function(){
    this.pos = Game.prototype.randomPosition();
    this.vel = Util.randomVec(0);
}

Util.inherits(Ship, MovingObject);

module.exports = Ship;