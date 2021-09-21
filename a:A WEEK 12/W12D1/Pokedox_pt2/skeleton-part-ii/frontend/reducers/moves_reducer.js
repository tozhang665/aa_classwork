import { RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';


const MovesReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
    case RECEIVE_SINGLE_POKEMON:
        return Object.assign({}, state,action.payload.moves)
    default:
    return state;
  }
}


export default MovesReducer;
