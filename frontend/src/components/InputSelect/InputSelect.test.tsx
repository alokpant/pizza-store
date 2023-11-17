import { render, fireEvent, screen } from '@testing-library/react';
import InputSelect from './InputSelect';

describe('InputSelect Component', () => {
  it('calls callBack function with the correct value on select change', () => {
    const mockCallBack = jest.fn();
    const options = [
      { value: 'name', text: 'Name' },
      { value: 'price', text: 'Price' },
    ];
    const mockLabel = 'Sort Label'

    render(
      <InputSelect
        callBack={mockCallBack}
        type="sort_by"
        formState={{ sort_by: 'name' }}
        label={mockLabel}
        options={options}
      />
    );

    const label = screen.getByText(mockLabel);
    expect(label).toBeInTheDocument();

    const selectInput = screen.getByDisplayValue('Name');
    expect(selectInput).toBeInTheDocument();

    fireEvent.change(selectInput, { target: { value: 'price' } });
    expect(mockCallBack).toHaveBeenCalledTimes(1);
    expect(mockCallBack).toHaveBeenCalledWith('price');
  });
});
