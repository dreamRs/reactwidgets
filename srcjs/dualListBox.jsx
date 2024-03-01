import { reactShinyInput } from "reactR";
import DualListBox from "react-dual-listbox";
import "react-dual-listbox/lib/react-dual-listbox.css";

const DualListBoxInput = ({ configuration, value, setValue }) => {
  return <DualListBox options={configuration.options} selected={configuration.selected} onChange={e => setValue(e.target.value)}/>;
};

reactShinyInput(".dualListBox", "reactwidgets.dualListBox", TextInput);
