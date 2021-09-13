import React from "react";
import * as Minesweeper from "../../minesweeper";


class Game extends React.Component{
  constructor(props){
    super(props)
    this.state= {objBoard: new Board }
    this.updateGame = this.updateGame.bind(this)
  }


  updateGame(){
    
  }


  render(){
    return(
      <div>
        {/* <Board board = {this.state.objBoard}  updateGame = {this.updateGame}/> */}
        T
      </div>
    )
  }

}

export default Game;