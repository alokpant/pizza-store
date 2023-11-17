import { useState, useEffect } from 'react';
import MenuList from './components/MenuList/MenuList';
import InputField from './components/InputField/InputField';
import InputSelect from './components/InputSelect/InputSelect';
import { buildUrlParams } from './helpers/utils';

export interface FormState {
  search?: string,
  sort_by: string,
  order_by: string
}

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
        <div className='card-header'>
          <InputField search={formState.search} callBack={(value) => handleChange({ search: value })} />
          <InputSelect
            type='sort_by'
            formState={formState}
            options={
              [
                {value: 'name', text: 'Name'},
                {value: 'price', text: 'Price'},
              ]
            }
            label='Sort by'
            callBack={(value) => handleChange({ sort_by: value })}
          />
          <InputSelect
            type='order_by'
            formState={formState}
            options={
              [
                {value: 'ascending', text: 'Asc'},
                {value: 'descending', text: 'Desc'},
              ]
            }
            label='Order by'
            callBack={(value) => handleChange({ order_by: value })}
          />
        </div>
        <MenuList menus={menus} />
      </div>
    </div>
  );
}

export default App;
