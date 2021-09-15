import React from "react";
import TodoListItem from "./todo_list_item";

class TodoList extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    console.log(this.props.todos)
    return(
      <ul>
        {this.props.todos.map((ele,idx)=>{
          return (
            <li key={idx}>
              <TodoListItem obj={ele}/>
            </li>
          )
        })}
      </ul>
    )
  }
}

export default TodoList;