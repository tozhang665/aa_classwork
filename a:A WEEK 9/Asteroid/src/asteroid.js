const MovingObject = require("./moving_object");
const Util = require("./utils");

function Asteroid(options) {
    options.color = options.color || "#404E4D";
    options.radius = options.radius || 30;
    options.vel = Util.randomVec(1);
    // options.vel = [0,0];
    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;