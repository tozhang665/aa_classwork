import React from "react";

function Modal(props){
  return(
  <div className="modal">
  <div className="modal-text">
    {props.string}
    <br />
    <button onClick={props.restart}>
      restart
    </button>
  </div>
  </div>
  )}

export default Modal;