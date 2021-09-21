import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import * as ACTIONS from './actions/pokemon_actions'


document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();

  window.getState = store.getState;

  window.requestSinglePokemon = ACTIONS.requestSinglePokemon;
  window.dispatch = store.dispatch;
  
  ReactDOM.render(<Root store={store} />, rootEl)
})