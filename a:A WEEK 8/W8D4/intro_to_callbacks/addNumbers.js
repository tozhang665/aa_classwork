const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

addNumbers = function(sum, numsLeft, callback) {

  if (numsLeft === 0) return
  reader.question ("What value would you like to add?", response => {
    sum += parseInt(response);
    callback(sum);
    numsLeft -= 1;
    addNumbers(sum, numsLeft, callback);
    if (numsLeft === 0) {
      reader.close();
    }
  });
}




addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));