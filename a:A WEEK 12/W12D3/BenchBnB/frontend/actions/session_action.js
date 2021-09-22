export const NEW_SESSION = "NEW_SESSION";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
import {signupUser,loginUser,logoutUser} from "../util/session_api_util";


export const newSession = (user) => ({
  type: NEW_SESSION,
  user
});



export const createSession = user => dispatch => (
  loginUser(user).then( data => dispatch(newSession(data)))
);