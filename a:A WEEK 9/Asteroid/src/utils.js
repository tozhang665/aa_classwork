// Function.prototype.inherits = function(ParentClass){
//   function Surrogate(){};
//   Surrogate.prototype = ParentClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }

const Util = {
  inherits(ChildClass,ParentClass) {
    // function Surrogate(){};
    // Surrogate.prototype = ParentClass.prototype;
    // childClass.prototype = new Surrogate();
    ChildClass.prototype = Object.create(ParentClass.prototype);
    ChildClass.prototype.constructor = ChildClass;
  },

  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  // Scale the length of a vector by the given amount.
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
}

module.exports = Util;