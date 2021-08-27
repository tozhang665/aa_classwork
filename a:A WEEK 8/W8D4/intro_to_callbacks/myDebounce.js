class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}

// Function.prototype.myDebounce = function(interval, bool) {
//   if (!bool) {
//     bool = false
//   }
//   if (!bool) {
//     bool = true;
//     return this.call()
//   } else {
//     setTimeout( () => {
//       bool = false;
//       this.call()
//     }, interval)
//   }
//   this.myDebounce(interval, bool)
// }
Function.prototype.myDebounce = function(interval){
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

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};

queryForHelloWorld();
searchBar.search = searchBar.search.myDebounce(2000);