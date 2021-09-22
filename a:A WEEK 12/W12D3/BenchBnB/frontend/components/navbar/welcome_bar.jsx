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

          <Link>LogOut</Link>
        </header>
      )
    }else{
      return(
        <header className="nav-bar">
          <h1>BenchBnB</h1>
        </header>
      )
    }
  }
}

export default welcomeBar