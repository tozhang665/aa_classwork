import React from "react";

class PokemonDetail extends React.Component{
  constructor(props){
    super(props)
  }


  componentDidMount(){
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  render(){
    const currentPokemon = this.props.pokemon[this.props.match.params.pokemonId]
    console.log(currentPokemon);
    return(
      <section>
        <ul>
          Hello
        </ul>
      </section>
    )
  }
}

export default PokemonDetail