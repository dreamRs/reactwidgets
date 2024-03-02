import { reactShinyInput } from "reactR";
import React, { useState } from "react";
import Select from "react-select";
import LabelInput from "./LabelInput";

const ReactSelectInput = ({ configuration, value, setValue }) => {
  const [selectedOption, setSelectedOption] = useState(value);
  function onChange(newValue) {
    setSelectedOption(newValue)
    setValue(newValue)
  }
  return (
    <div class="form-group shiny-input-container" style={{width: configuration.width}}>
      <LabelInput
        config={configuration.label}
      />
      <Select
        defaultValue={selectedOption}
        onChange={onChange}
        options={configuration.options}
      />
    </div>
  );
}

reactShinyInput(".react-select", "reactwidgets.reactSelect", ReactSelectInput);
