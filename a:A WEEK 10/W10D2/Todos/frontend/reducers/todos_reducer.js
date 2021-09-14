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
  const newState = {};
  // const newNewState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_TODOS:
        // console.log(action);
        action.todos.forEach( (todo) => {
          newState[todo.id] = todo;
        })

        return newState;
      break;
    case(RECEIVE_TODO):

        newNewState[action.todo.id] = action.todo;
        return newNewState;
      break;

    default:
      console.log(action.todos);
      return newNewState;
  }
};

export default todosReducer;