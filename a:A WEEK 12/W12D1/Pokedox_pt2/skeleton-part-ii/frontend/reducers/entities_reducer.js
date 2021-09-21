import {combineReducers} from 'redux';
import pokemonReducer from './pokemon_reducer';
import itemReducer from './items_reducer'
import MovesReducer from './moves_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemReducer,
  moves: MovesReducer
})

export default entitiesReducer;