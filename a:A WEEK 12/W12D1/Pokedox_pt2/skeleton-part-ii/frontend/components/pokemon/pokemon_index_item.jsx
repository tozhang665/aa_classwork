import React from "react"
import { Link } from "react-router-dom";

export const PokemonIndexItem = (props) => {
    return (
        <li className="pokemon-index-item">
            <Link to={`/pokemon/${props.pokemon.id}`}>
                <span>{props.pokemon.id}</span>
                <img src={props.pokemon.imageUrl}/>
                <span>{props.pokemon.name}</span>
            </Link>
        </li>
    )
}