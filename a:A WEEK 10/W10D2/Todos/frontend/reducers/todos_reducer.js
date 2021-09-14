import { RECEIVE_TODO,RECEIVE_TODOS } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};



const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = Object.assign({},state);
  switch (action.type) {
    case RECEIVE_TODOS:
        console.log(action);
        newState[action.todos.id] = action.todos;
        return newState
      break;
    case(RECEIVE_TODO):

      break;

    default:
      return state;
  }
};

export default todosReducer;