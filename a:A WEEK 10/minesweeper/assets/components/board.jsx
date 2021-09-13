import React from "react";
import * as Minesweeper from "../../minesweeper";
import Tile from "./tile.jsx"


class Board extends React.Component{
  constructor(props){
    super(props)
    this.state = {
      boardClass: this.props.board
    }
  }


  render(){
    return(
    <div>
      {this.state.boardClass.grid.map((row,idx) =>{
        return(
          <div key={idx}>
            {row.map((ele,idx2)=>{
              return(
                <Tile tileobj = {ele}  updateGame = {this.props.updateGame} key={idx2}/>
              )
            })}
          </div>
        )
      })}
    </div>
    )
  }
}


export default Board