import { useState, useEffect } from 'react';
import MenuList from './components/MenuList/MenuList';
import InputField from './components/InputField/InputField';
import { buildUrlParams } from './helpers/utils';

function App() {
  const [menus, setMenus] = useState<Array<{
    id: number;
    name: string;
    price: number;
  }>>([]);
  const [formState, setFormState] = useState<Record<string, string | undefined>>({
    search: undefined,
    sort_by: 'name',
    order_by: 'ascending'
  })
  const [refetchCounter, setRefetchCounter] = useState<number>(0);

  useEffect(() => {
    const apiUrl = `http://localhost:3000/menus?${buildUrlParams(formState)}`;

    fetch(apiUrl)
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        setMenus(data);
      })
      .catch(error => {
        console.error('Error fetching data:', error.message);
      });
  }, [formState, refetchCounter]);

  const handleSortOrderChange: React.ChangeEventHandler<HTMLInputElement> = event => {
    handleChange({ sort_by: event.target.value });
  };

  const handleSearchChange: React.ChangeEventHandler<HTMLInputElement> = event => {
    handleChange({ search: event.target.value });
  };

  const handleChange = (param: Record<string, string>) => {
    setFormState({
      ...formState,
      ...param,
    });
    setRefetchCounter(refetchCounter + 1)
  }

  return (
    <div className="card">
      <div className='card-form'>
        <InputField search={formState.search} handleSearchChange={handleSearchChange} />
        <MenuList menus={menus} />
      </div>
    </div>
  );
}

export default App;
