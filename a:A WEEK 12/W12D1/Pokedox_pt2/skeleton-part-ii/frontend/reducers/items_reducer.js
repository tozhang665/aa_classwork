import { RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';


const ItemReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
    case RECEIVE_SINGLE_POKEMON:
        return Object.assign({}, state,action.payload.items)
    default:
    return state;
  }
}


export default ItemReducer;
