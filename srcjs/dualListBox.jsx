import { reactShinyInput } from "reactR";
import React, { useState } from "react";
import DualListBox from "react-dual-listbox";
import "react-dual-listbox/lib/react-dual-listbox.css";


const DualListBoxInput = ({ configuration, value, setValue }) => {
  const [selected, setSelected] = useState(configuration.selected);
  //setValue(configuration.selected);
  function onChange(newValue) {
    setSelected(newValue)
    setValue(newValue)
  }
  return (
        <DualListBox
            options={configuration.options}
            selected={selected}
            onChange={onChange}
            canFilter={configuration.canFilter}
            showOrderButtons={configuration.showOrderButtons}
            preserveSelectOrder={configuration.preserveSelectOrder}
            alignActions={configuration.alignActions}
        />
    );
};

reactShinyInput(".dualListBox", "reactwidgets.dualListBox", DualListBoxInput);
