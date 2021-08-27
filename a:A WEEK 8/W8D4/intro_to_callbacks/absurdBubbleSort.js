const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(`Is ${el1} larger than ${el2}? Y or N: `, response => {
    if (response === "Y") callback(true);
    else if (response === "N") callback(false);
    else throw new Error("ya goofed");
  })

}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  // [3,2,1] , 0 , true, outer

  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.


  //arr = [1,2,3]
  // i = 0 1 2
  // i === i + 1

  // 2  === 3

  let swap = function(bool){
    if(bool){
      let bucket = arr[i];
      arr[i] = arr[i+1];
      arr[i+1] = bucket;
      madeAnySwaps = true;
    }
    i += 1;
    innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop)
  }

  if (i === arr.length - 1) outerBubbleSortLoop(madeAnySwaps)
  else {
    askIfGreaterThan(arr[i],arr[i+1],swap);

    // if (askIfGreaterThan(arr[i], arr[i+1], --------- )){


    //   let bucket = arr[i];
    //   arr[i] = arr[i+1];
    //   arr[i+1] = bucket;
    //   madeAnySwaps = true;
    // }


    // i += 1;
    // innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop)
  }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.


function absurdBubbleSort(arr, sortCompletionCallback) {


  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps){
      madeAnySwaps = false;
      innerBubbleSortLoop(arr,0,madeAnySwaps,outerBubbleSortLoop);
    }
    else{
      sortCompletionCallback(arr);
    }
  }



  // Kick the first outer loop off, starting `madeAnySwaps` as true.

  // START THE LOOP, STARTING 'madeAnySwaps as true;
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});