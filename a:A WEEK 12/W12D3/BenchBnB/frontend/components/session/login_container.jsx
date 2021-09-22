import { connect } from "react-redux";
import { createSession } from "../../actions/session_action";
import Login from "./login";


const mapDispatchToProps = dispatch =>({
  createSession: formUser=> dispatch(createSession(formUser))
})


export default connect(null,mapDispatchToProps)(Login);