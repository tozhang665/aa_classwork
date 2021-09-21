import * as sessionUtil from "../utils/session"


export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";


const receieveCurrentUser = user =>({
  type: RECEIVE_CURRENT_USER,
  user,
});


const logoutCurrentUser = () =>({
  type: LOGOUT_CURRENT_USER,
});


export const createNewUser = formUser => dispatch => sessionUtil.postUser(formUser)
.then((user)=>dispatch(receieveCurrentUser(user)));

export const login = formUser => dispatch => sessionUtil.postSession(formUser)
.then((user)=>dispatch((receieveCurrentUser(user))));

export const logout = () => dispatch => sessionUtil.deleteSession()
.then(()=>dispatch(logoutCurrentUser()));


