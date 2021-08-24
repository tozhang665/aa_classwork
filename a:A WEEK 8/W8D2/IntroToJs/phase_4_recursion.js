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
  if(arr.length === 1){
    return arr[0];
  }

  let val = arr[0]
  let myArr = val + sumRec(arr.slice(1, arr.length));
  return myArr;

}

function exponent(base,exp){
  if(exp === 0){
    return 1;
  }

  let val = base * exponent(base, exp - 1);
  return val;
}

function exponent2(base, exp){
  if(exp === 0){
    return 1;
  } else if(exp === 1){
    return base;
  }
  let val;
  if(exp % 2 === 0){
    val = exponent2(base, exp / 2) ** 2
  } else {
    val = base * (exponent2(base, (exp - 1)/ 2) ** 2)
  }
  return val;
}