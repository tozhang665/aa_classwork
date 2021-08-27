class Neuron {
  fire() {
    console.log("Firing!");
  }
}


// let myThrottle = function(interval){
//   let tooSoon = false;

//   if (!tooSoon) {
//     tooSoon = true; 
//     setTimeout( function() {
//       tooSoon = false
//       neuron.fire()
//       myThrottle()
//     }, 1000)
//   }
// }

neuron = new Neuron();

Function.prototype.myThrottle = function(interval){
  let tooSoon = false;

  if (!tooSoon) {
    tooSoon = true; 
    setTimeout( () => {
      tooSoon = false
      this.call()
      this.myThrottle(interval)
    }, interval)
  }
}

neuron.fire.myThrottle(3000)