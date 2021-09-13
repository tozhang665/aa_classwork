import React from "react";
import * as Minesweeper from "../../minesweeper";
import Board from "./board.jsx"


class Game extends React.Component{
  constructor(props){
    super(props)
    this.state= {
      objBoard: new Minesweeper.Board(9,2)
    }
    this.updateGame = this.updateGame.bind(this)
  }


  updateGame(){
    
  }


  render(){
    return(
      <div>
        <Board board = {this.state.objBoard}  updateGame = {this.updateGame}/>
        <h1>Hello</h1>
      </div>
    )
  }
}

export default Game;