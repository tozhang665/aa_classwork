import React from "react";
import ReactDOM from "react-dom";
import {signupUser, loginUser, logoutUser} from './util/session_api_util';
import createStore from "./store/store";
import Root from "./components/root";
import {fetchBenches} from './util/bench_api_util'
import {fetchBenchesUtil} from './actions/bench_actions'

document.addEventListener("DOMContentLoaded", () => {

  const mainDiv = document.getElementById("root");
  
  let preloadedState = undefined;
  
  if (window.currentUser) {
    preloadedState = {
      session: {
        currentUser: window.currentUser
      }
    };
  }
  
  const store = createStore(preloadedState);
  window.signupUser = signupUser;
  window.loginUser = loginUser;
  window.logoutUser = logoutUser;
  window.fetchBenches = fetchBenches;
  window.fetchBenchesUtil = fetchBenchesUtil;

  window.dispatch = store.dispatch;
  window.getState = store.getState;

  ReactDOM.render(<Root store={store}/>, mainDiv);
});