import { combineReducers } from 'redux';
import entitiesReducer from './entities';
import sessionsReducer from './session';

export default combineReducers({
  entities: entitiesReducer,
  session: sessionsReducer,
});
