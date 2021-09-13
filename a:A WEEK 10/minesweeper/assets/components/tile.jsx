import React from "react";
import * as Minesweeper from "../../minesweeper";


class Tile extends React.Component{
  constructor(props){
    super(props)

    this.state = {
      tileOBJ: this.props.tileobj
    }
    this.grabSYM = this.grabSYM.bind(this);
  }

  grabSYM(){
    if(this.state.tileOBJ.bombed){
      return "U+1F4A3";
    }else if(this.state.tileOBJ.flagged){
      return "U+1F6A9";
    }else if(this.state.tileOBJ.explored){
      return this.state.tileOBJ.adjacentBombCount().toString();
    }else{
      return "x";
    }
  }

  render(){
    let sym = this.grabSYM()
    return(
      <div>
        <h1>{sym}</h1>
      </div>
    )
  }
}

export default Tile




// 💣
// ⚑
//U+1F6A9
//🚩
//U+1F6A9
//U+1F4A3
