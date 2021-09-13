import React from "react";
import * as Minesweeper from "../../minesweeper";


class Tile extends React.Component{
  constructor(props){
    super(props)

    this.state = {
      tileOBJ: this.props.tileobj
    }
    this.grabSYM = this.grabSYM.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  grabSYM(){
    if(this.state.tileOBJ.bombed && this.state.tileOBJ.explored){
      return "💣";
    }else if(this.state.tileOBJ.flagged){
      return "🚩";
    }else if(this.state.tileOBJ.explored){
      if(this.state.tileOBJ.adjacentBombCount().toString() === "0"){
        return "";
      }else {
        return this.state.tileOBJ.adjacentBombCount().toString();
      };
    }else{
      return "";
    }
  }

  handleClick(e){
    e.preventDefault();
    const flagged = e.altKey ? true : false;
    this.props.updateGame(this.state.tileOBJ, flagged);
  }

  render(){
    let sym = this.grabSYM();
    let className = "tile";
    if(this.state.tileOBJ.revealed){
      className = "tile revealed";
    }
    return(
      <div className={className}>
        <button onClick={this.handleClick}>{sym}</button>
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
