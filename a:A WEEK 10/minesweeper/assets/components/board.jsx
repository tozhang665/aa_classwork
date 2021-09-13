import React from "react";
import * as Minesweeper from "../../minesweeper";


class Board extends React.Component{
  constructor(props){
    super(props)

    this.state = {
      boardOBJ: new Minesweeper.Board(9,2)
    }
  }


  render(){
    return(
    <div>
      {this.props.board.map((ele,idx) =>{
        <div key={idx}>
          {ele.map((innerELE,idx2)=>{
            <Tile tileobj={innerELE} updateGame={this.props.updateGame} key={idx2}/>
          })}
        </div>
      })}
    </div>
    )
  }
}


