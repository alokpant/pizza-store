import React from 'react';
import { render, fireEvent, screen } from '@testing-library/react';
import InputField from './InputField';

describe('InputField', () => {
  it('calls callBack function with the correct value on label click', () => {
    const NEW_INPUT_VALUE = 'new value'
    const mockCallBack = jest.fn();

    render(<InputField callBack={mockCallBack} search="test" />);

    expect(screen.getByText('Search')).toBeInTheDocument();

    const inputElement = screen.getByDisplayValue('test');
    expect(inputElement).toBeInTheDocument();

    fireEvent.change(inputElement, { target: { value: NEW_INPUT_VALUE } });
    expect(mockCallBack).toHaveBeenCalledTimes(1);
    expect(mockCallBack).toHaveBeenCalledWith(NEW_INPUT_VALUE);

    fireEvent.change(inputElement, { target: { value: '' } });
    expect(mockCallBack).toHaveBeenCalledTimes(2);
    expect(mockCallBack).toHaveBeenCalledWith('');
  });
});
