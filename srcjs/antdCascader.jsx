import { reactShinyInput } from "reactR";
import React, { useState } from "react";
import { Cascader } from "antd";
import LabelInput from "./LabelInput";


const CascaderInput = ({ configuration, value, setValue }) => {
  const [selected, setSelected] = useState(value);
  function onChange(newValue) {
    setValue(newValue)
  }
  return (
        <div class="form-group shiny-input-container" style={{width: configuration.width}}>
          <LabelInput
              config={configuration.label}
          />
          <Cascader 
            options={configuration.options} 
            onChange={onChange} 
            {...configuration.props}
          />
        </div>
    );
};

reactShinyInput(".antdCascader", "reactwidgets.antdCascader", CascaderInput);
