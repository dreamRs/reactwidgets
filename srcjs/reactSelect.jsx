import { reactShinyInput } from "reactR";
import React, { useState } from "react";
import Select from "react-select";
import LabelInput from "./LabelInput";

const ReactSelectInput = ({ configuration, value, setValue }) => {
  const [selectedOption, setSelectedOption] = useState(null);
  const handleSinglevalue = (value) => value === null ? [] : value.value;
  function onChange(newValue) {
    setSelectedOption(newValue)
    setValue(configuration.isMulti ? newValue.map(v => v.value) : handleSinglevalue(newValue))
  }
  return (
    <div class="form-group shiny-input-container" style={{width: configuration.width}}>
      <LabelInput
        config={configuration.label}
      />
      <Select
        placeholder={configuration.placeholder}
        defaultValue={configuration.selected}
        onChange={onChange}
        options={configuration.options}
        isMulti={configuration.isMulti}
        closeMenuOnSelect={configuration.closeMenuOnSelect}
        isSearchable={configuration.isSearchable}
        isDisabled={configuration.isDisabled}
      />
    </div>
  );
}

reactShinyInput(".react-select", "reactwidgets.reactSelect", ReactSelectInput);
