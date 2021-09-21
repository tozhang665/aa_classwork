import React from "react"
import { Route } from "react-router-dom";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from "./pokemon/pokemon_detail_container";
import { Switch } from "react-router";

const App = () => (
    <Switch>
      <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
      <Route path="/" component={PokemonIndexContainer} />
    </Switch>
) 

export default App;