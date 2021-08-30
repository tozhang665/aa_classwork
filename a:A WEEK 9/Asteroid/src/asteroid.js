const MovingObject = require("./moving_object");
const Util = require("./utils");
const Ship = require("./ship");

function Asteroid(options) {
    options.color = options.color || "#404E4D";
    options.radius = options.radius || 30;
    options.vel = Util.randomVec(1);
    MovingObject.call(this, options);
}

Asteroid.prototype.isCollidedWith = function(otherObject) {
    if (otherObject instanceof Ship) {
        let difference = [this.pos[0] - otherObject.pos[0], this.pos[1] - otherObject.pos[1]];

        let hyp = Math.sqrt((difference[0]**2) + (difference[1] **2));
        let radSum = this.radius + otherObject.radius;

        if (radSum >= hyp) {
            return true;
        } else {
            return false;
        }
    }
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;