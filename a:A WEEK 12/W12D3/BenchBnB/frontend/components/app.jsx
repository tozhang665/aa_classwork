import { Route } from "react-router";
import React from "react";
import WelcomeBarContainer from "./navbar/welcome_bar_container";
import LoginContainer from "./session/login_container";

export default ()=>(
  <div>
    <Route path="/" component={WelcomeBarContainer}/>
    <Route exact path="/login" component={LoginContainer}/>
  </div>
)