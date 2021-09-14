import React from "react";
import * as Minesweeper from "../../minesweeper";
import Board from "./board.jsx"
import Modal from "./modal.jsx"

class Game extends React.Component{
  constructor(props){
    super(props)
    this.state= {
      objBoard: new Minesweeper.Board(20,1),
      gameOver: "false"
    }
    this.updateGame = this.updateGame.bind(this)
    this.restartGame = this.restartGame.bind(this)
  }


  restartGame(){
    this.setState({objBoard: new Minesweeper.Board(20,1) , gameOver: "false"}, ()=>{
      console.log("new Game")
      console.log(this.state.objBoard);
      console.log(this.state.gameOver);
      this.render()
    })
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
      this.setState({gameOver: 'you have lost'});
    } else if (this.state.objBoard.won()){
      this.setState({gameOver: 'you have won'});
    }
  }


  render(){
    if (this.state.gameOver === "false"){
      return(
        <div>
          <Board board = {this.state.objBoard}  updateGame = {this.updateGame}/>
        </div>
      )
    } else {
      return(
        <div>
          <Modal string={this.state.gameOver} restart = {this.restartGame}/>
          <Board board = {this.state.objBoard}  updateGame = {this.updateGame}/>
        </div>
      )
    }
  }
}

export default Game;