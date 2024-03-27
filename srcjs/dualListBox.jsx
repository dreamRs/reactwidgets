import { reactShinyInput } from "reactR";
import React, { useState } from "react";
import DualListBox from "react-dual-listbox";
import "react-dual-listbox/lib/react-dual-listbox.css";
import LabelInput from "./LabelInput";

const DualListBoxInput = ({ configuration, value, setValue }) => {
  const [selected, setSelected] = useState(value);
  function onChange(newValue) {
    setSelected(newValue)
    setValue(newValue)
  }
  return (
        <div class="form-group shiny-input-container" style={{width: configuration.width}}>
          <LabelInput
              config={configuration.label}
          />
          <DualListBox
              id={configuration.id}
              options={configuration.options}
              selected={value}
              onChange={onChange}
              canFilter={configuration.canFilter}
              showOrderButtons={configuration.showOrderButtons}
              preserveSelectOrder={configuration.preserveSelectOrder}
              alignActions={configuration.alignActions}
          />
        </div>
    );
};

reactShinyInput(".dualListBox", "reactwidgets.dualListBox", DualListBoxInput);
