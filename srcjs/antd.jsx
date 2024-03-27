import { reactShinyInput } from "reactR";
import { Cascader, DatePicker } from "antd";
import dayjs from 'dayjs';
import LabelInput from "./LabelInput";


const CascaderInput = ({ configuration, value, setValue }) => {
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




const DatePickerInput = ({ configuration, value, setValue }) => {
  function onChange(date, dateString) {
    setValue(dateString)
  }
  if (value !== null) {
    value = dayjs(value, "YYYY-MM-DD")
  }
  return (
        <div class="form-group shiny-input-container" style={{width: configuration.width}}>
          <LabelInput
              config={configuration.label}
          />
          <DatePicker 
            defaultValue={value}
            onChange={onChange} 
            {...configuration.props}
          />
        </div>
    );
};

reactShinyInput(".antdDatePicker", "reactwidgets.antdDatePicker", DatePickerInput);



const DateRangePickerInput = ({ configuration, value, setValue }) => {
  const { RangePicker } = DatePicker;
  function onChange(date, dateString) {
    setValue(dateString)
  }
  return (
        <div class="form-group shiny-input-container" style={{width: configuration.width}}>
          <LabelInput
              config={configuration.label}
          />
          <RangePicker 
            onChange={onChange} 
            {...configuration.props}
          />
        </div>
    );
};

reactShinyInput(".antdDateRangePicker", "reactwidgets.antdDateRangePicker", DateRangePickerInput);
