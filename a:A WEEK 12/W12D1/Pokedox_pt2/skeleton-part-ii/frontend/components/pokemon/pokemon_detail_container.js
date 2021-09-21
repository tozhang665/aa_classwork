import {connect} from 'react-redux';
// import {requestAllPokemon} from './../../actions/pokemon_actions';
import { requestSinglePokemon } from './../../actions/pokemon_actions';
import {selectAllPokemon} from './../../reducers/selectors';
import PokemonDetail from './pokemon_detail';


const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
})

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)