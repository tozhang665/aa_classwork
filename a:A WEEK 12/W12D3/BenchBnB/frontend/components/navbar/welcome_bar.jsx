import React from 'react';
import { Link } from 'react-router-dom';

class welcomeBar extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    if(this.props.user){
      return(
        <header className="nav-bar">
          <h1>BenchBnB</h1>
          <h4>Welcome { this.props.user.username }!</h4>

        </header>
      )
    }else{
      return(
        <header className="nav-bar">
          <h1>BenchBnB</h1>
          <Link to="/login">Login</Link>
        </header>
      )
    }
  }
}

export default welcomeBar