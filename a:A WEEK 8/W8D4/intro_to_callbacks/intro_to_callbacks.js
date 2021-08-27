class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let time = new Date();
    this.hours = time.getHours();
    this.minutes = time.getMinutes(); 
    this.seconds = time.getSeconds();

    this.printTime()

    let callback = this._tick.bind(this);
    setInterval(callback, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds += 1
    if (this.seconds > 60) {
      this.seconds = 0;
      this.minutes += 1
    }
    if (this.minutes > 60) {
      this.minutes = 0;
      this.hours += 1
    }
    if (this.hours > 24) {
      this.hours = 0;
    }
    return this.printTime()
  }
}

const clock = new Clock();