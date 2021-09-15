import React from "react";


class todoListItem extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    return(
      <ul>
        ID: {this.props.obj.id}
        <br />
        TITLE: {this.props.obj.title} 
        <br />
        BODY: {this.props.obj.body}
        <br />
        DONE: {this.props.obj.done.toString()}
        <br />
      </ul>
    )
  }
}

export default todoListItem;