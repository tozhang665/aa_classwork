import {RECEIVE_TODOS, RECEIVE_TODO} from "./todo_actions"

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};


export const receiveTodo = (todo) =>{
  return{
    type: RECEIVE_TODO,
    todo
  }

}