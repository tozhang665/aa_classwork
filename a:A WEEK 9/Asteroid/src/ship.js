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



module.exports = Ship;