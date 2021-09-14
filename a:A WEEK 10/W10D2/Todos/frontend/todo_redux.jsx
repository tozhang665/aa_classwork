import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store.js"



document.addEventListener("DOMContentLoaded",()=>{
  const store = configureStore()
  store.configureStore = configureStore
  window.store = store;
  console.log("added")

  const root = document.getElementById("root")
  ReactDOM.render(<h1>Todos App</h1>,root);
})