Array.prototype.uniq = function(){
  let arr = [];
  for(let i = 0; i < this.length; i++){
    if(!arr.includes(this[i])){
      arr.push(this[i]);
    }
  }
  return arr;
}
// Array.uniq([1,2,3,4])
// console.log([1,2,2,3,3,3,5,74,7,2,74].uniq()); // [1,2,3]

Array.prototype.twoSum = function(){
  let arr = [];
  for(let i  = 0 ; i < this.length - 1 ; i++){
    for(let j = i + 1; j < this.length ; j++){
      if(this[i] + this[j] === 0){
        arr.push([i,j]);
      }
    }
  }
  return arr;
}

// console.log([-1,-2,-3,1,2,3,5,456,132,-456].twoSum())

Array.prototype.transpose = function(){
  let arr = [];


  // for(let i = 0; i < this.length - 1;i++){
  //   for(let j = 0; j < this[i].length ; j++){
  //     arr.push( [   this[i][j] , this[i+1][j] ] );
  //   }
  // }

  


  return arr;
}

console.log([[1,2,3],[4,5,6],[7,8,9]].transpose()) // [[1,4,7],[2,5,8],[3,6,9]]