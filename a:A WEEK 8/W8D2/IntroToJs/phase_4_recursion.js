function range(start,end){
  if(start === end){
    return end
  }
  let arr = [];
  arr.push(start)
  arr = arr.concat(range(start+1,end));
  return arr
}

function sumRec(arr){
  if(arr.length <= 1){
    return arr
  }
  let val = arr[0] + sumRec(arr.slice(1,arr.length-1))
  return val

}

function exponent(base,exp){

}