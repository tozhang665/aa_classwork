// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);

  for(let i = 0; i < grid.length;i++){
    grid[i] = new Array(8);
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  //pos = [3,3]
  return pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] <8;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if(!this.isValidPos(pos)){
    throw new Error("Not valid pos!");
  }
  return this.grid[pos[0]][pos[1]];
};


/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  if (piece) {
    return piece.color === color;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.getPiece(pos);
  // console.log(piece instanceof Piece);
    return piece instanceof Piece;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip = []){
  //this.grid, pos,
  let newPos = []
  newPos.push(pos[0] + dir[0]);
  newPos.push(pos[1] + dir[1]);
  if (!this.isValidPos(newPos) || !(this.grid[newPos[0]][newPos[1]] instanceof Piece)) {
    return [];
  }
  if (this.isMine(newPos, color)){
    return piecesToFlip;
  }
  piecesToFlip.push(newPos);
  return this._positionsToFlip(newPos, color, dir, piecesToFlip);
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let flag = false;
  Board.DIRS.forEach((el) => {
    let val = this._positionsToFlip(pos, color, el);
    if (val.length > 0){
      flag = true;
    }
  });
  return flag;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw new Error("Invalid move!");
  }
  this.grid[pos[0]][pos[1]] = new Piece(color); 
  let captured = [];
  Board.DIRS.forEach(el => {
    captured = captured.concat(this._positionsToFlip(pos, color, el));
  });
  captured.forEach(el => {
    this.getPiece(el).flip();
  });
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {


  let captured = [];

  // debugger

  // this.grid.forEach((row,idx) =>{

    
  //   row.forEach((piece,idy) =>{
    
  //     console.log(piece);
  //     let pos = [idx,idy];
      
  //     if(!this.isOccupied(pos)){

  //       if(this.validMove(pos,color)){

  //         captured.push(pos);

  //       }

  //     }

  //   })
  // })


  for(let i = 0; i < this.grid.length;i++){
    for(let j = 0; j < this.grid[0].length;j++){
      console.log(this.grid[i][j]);


      let pos = [i,j];
      
      if(!this.isOccupied(pos)){

        if(this.validMove(pos,color)){

          captured.push(pos);

        }

      }

    }
  }
  return captured;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") && !this.hasMove("black")
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log("  0 1 2 3 4 5 6 7");
  for(let i = 0;i<this.grid.length;i++){
    let arr = [i]
    for(let j = 0; j<this.grid[0].length;j++){
      if(this.grid[i][j] instanceof Piece){
        arr.push(this.grid[i][j].toString());
      }else{
        arr.push("_");
      }
    }
    console.log(arr.join(" "))
  }
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE