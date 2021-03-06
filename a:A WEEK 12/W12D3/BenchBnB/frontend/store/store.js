import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import thunk from '../thunk/thunk';
import rootReducer from '../reducers/root_reducer';


export default (preloadedState = {}) => createStore(
  rootReducer, preloadedState,
  applyMiddleware(thunk, logger)
);