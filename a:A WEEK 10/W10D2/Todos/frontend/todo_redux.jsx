import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store.js"
import {receiveTodos, receiveTodo,removeTodo} from "./actions/receiveTodos.js"
import {receiveSteps, receiveStep,removeStep} from "./actions/receiveSteps.js"
import { allTodos } from "./reducers/selectors.js";
import App from "./components/app"
import Root from "./components/root"


document.addEventListener("DOMContentLoaded",()=>{
  const store = configureStore()
  store.configureStore = configureStore

  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  
  window.allTodos = allTodos;
  

  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;

  
  console.log("added")

  const root = document.getElementById("root")



  ReactDOM.render(<Root store={store}/>,root);



})