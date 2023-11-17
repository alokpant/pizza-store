import React, { useState } from 'react';
import { FormState } from '../../App';

type FormStateType = keyof {
  [P in keyof FormState as FormState[P] extends string ? P: never]: any
}

interface SelectInputProps {
  callBack: (value: string) => void
  type: FormStateType
  formState: Record<string, string | undefined>
  label: string
  options: Record<string, string>[]
}

const InputSelect: React.FC<SelectInputProps> = (
  {
    callBack,
    type,
    formState,
    label,
    options
  }
) => {
  const [selectedOption, setSelectedOption] = useState(formState[type]);

  const handleSelectChange = (event: React.ChangeEvent<HTMLSelectElement>): void => {
    setSelectedOption(event.target.value);
    callBack(event.target.value)
  };

  return (
    <div className="input-select">
      <label className='input-select__label'>{label}</label>
      <select value={selectedOption} onChange={handleSelectChange} className='input-select__select'>
        {options.map(option => (
          <option key={option.value} value={option.value}>
            {option.text}
          </option>
        ))}
      </select>
    </div>
  );
}

export default InputSelect;
