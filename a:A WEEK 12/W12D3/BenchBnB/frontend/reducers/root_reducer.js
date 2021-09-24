import { combineReducers } from "redux";
import sessionsReducer from "./session_reducer";
import benchesReducer from "./benches_reducer";


const rootReducer = combineReducers({
  session:sessionsReducer,
  benches:benchesReducer
})


export default rootReducer