Array.prototype.myEach = function(callback) {
   
    for(let i = 0; i < this.length; i++){
        let el = this[i];
      callback(el);
    }
    
}

const doubler = function(el){
    console.log(el * 2);
}

let arr = [1,2,3]
// arr.myEach(doubler);

Array.prototype.myMap = function(callback) {
    let newarr = [];
    this.myEach( (el)=> newarr.push(callback(el)))
    return newarr;
}

// arr.myMap(doubler)

Array.prototype.myReduce = function(callback, initialValue){
    if(!initialValue){
        initialValue = this[0];
    }
    for(let i = 0; i < this.length; i++){
        intialValue = callback(initialValue, this[i]);
    }
    return initialValue;
}

// arr.myReduce(function(acc, el) {
//     return acc + el;
//   }); // => 6
  
//   // with initialValue
//   arr.myReduce(function(acc, el) {
//     return acc + el;
//   }, 25); // => 31