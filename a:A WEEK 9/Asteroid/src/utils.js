// Function.prototype.inherits = function(ParentClass){
//   function Surrogate(){};
//   Surrogate.prototype = ParentClass.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }

const Util = {
  inherits(childClass,ParentClass){
    function Surrogate(){};
    Surrogate.prototype = ParentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  }
}

// Util.inherits(child,parent);


// hello(str1,str2){

// }

module.exports = Util;