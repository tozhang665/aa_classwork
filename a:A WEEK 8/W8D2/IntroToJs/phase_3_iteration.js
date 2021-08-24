Array.prototype.bubbleSort = function(){

  for (let i = 0; i < this.length-1; i++) {
    for(let j = i + 1; j < this.length; j++){
      if (this[i] > this[j]){
        let val = this[i]
        this[i] = this[j]
        this[j] = val
      }
    }
  }
  return this
}

String.prototype.substrings = function(){
  let arr = []
  for(let i = 0; i < this.length; i ++){
    for(let j = i+1; j <= this.length; j++){
      arr.push(this.slice(i,j))
    }
  }
  return arr
}