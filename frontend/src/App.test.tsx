import { render, screen, act, fireEvent } from '@testing-library/react';
import App from './App';

describe('App Component', () => {
  const MOCK_DATA = [
    { id: 1, name: 'Pizza 1', price: 12.939341046547632 },
    { id: 2, name: 'Pizza 2', price: 15.163971628736483 },
  ]

  beforeEach(() => {
    fetch.resetMocks();
  });

  it('renders the App component', async () => {
    fetch.mockResponseOnce(JSON.stringify(MOCK_DATA));
    await act(async () => render(<App />));

    expect(screen.getByText(/Pizza 1/)).toBeInTheDocument();
    expect(screen.getByText(/Pizza 2/)).toBeInTheDocument();
    expect(fetch).toHaveBeenCalledTimes(1)
  });

  it('calls fetch again on user interaction', async () => {
    fetch.mockResponse(JSON.stringify(MOCK_DATA));
    await act(async () => {
      render(<App />)
    });

    const selectInput = screen.getByDisplayValue('Asc');
    await act(async () => {
      fireEvent.change(selectInput, { target: { value: 'descending' } });
    });

    expect(fetch).toHaveBeenCalledTimes(2)
  });
});

