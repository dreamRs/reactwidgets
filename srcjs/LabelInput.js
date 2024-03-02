import React from "react";

function LabelInput(props) {
  return (
    <label class={props.config.class} id={props.config.id} for={props.config.for}>
      {props.config.label}
    </label>
  );
};

export default LabelInput;
