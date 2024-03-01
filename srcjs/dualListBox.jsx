import { reactShinyInput } from "reactR";
import React, { useState } from "react";
import DualListBox from "react-dual-listbox";
import "react-dual-listbox/lib/react-dual-listbox.css";


const DualListBoxInput = ({ configuration, value, setValue }) => {
  //return <DualListBox options={configuration.options} onChange={e => setValue(e.target.value)}/>;
  const [selected, setSelected] = useState([]);
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
        />
    );
};

reactShinyInput(".dualListBox", "reactwidgets.dualListBox", DualListBoxInput);
