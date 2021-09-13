import React from "react";
import * as Minesweeper from "../../minesweeper";
import Board from "./board.jsx"
import Modal from "./modal.jsx"

class Game extends React.Component{
  constructor(props){
    super(props)
    this.state= {
      objBoard: new Minesweeper.Board(9,10),
      gameOver: false
    }
    this.updateGame = this.updateGame.bind(this)
  }


  updateGame(tile, bool){
    if(bool){
      tile.toggleFlag();
    } else {
      tile.explore();
      console.log(tile);
    }

    this.setState({board: this.state.board});

    if(this.state.objBoard.lost()){
      this.setState({gameOver: 'lost'});
    } else if (this.state.objBoard.won()){
      this.setState({gameOver: 'won'});
    }
  }


  render(){
    if (this.state.gameOver === false){
      return(
        <div>
          <Board board = {this.state.objBoard}  updateGame = {this.updateGame}/>
        </div>
      )
    } else {
      return(
        <div>
          <Board board = {this.state.objBoard}  updateGame = {this.updateGame}/>
          <Modal string={this.state.gameOver}/>
        </div>
      )
    }
  }
}

export default Game;