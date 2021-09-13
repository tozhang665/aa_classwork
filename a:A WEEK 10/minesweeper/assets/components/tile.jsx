import React from "react";
import * as Minesweeper from "../../minesweeper";


class Tile extends React.Component{
  constructor(props){
    super(props)

    this.state = {
      tileOBJ = new Minesweeper.Tile()
    }
  }

  grabsym(){
    if(currentState === "isBombed"){
    }
  }

  render(){

    return(
      <div>
        {this.state.currentState}
      </div>
    )
  }
}




// 💣
// ⚑
//U+1F6A9
//🚩
//U+1F6A9
//U+1F4A3
