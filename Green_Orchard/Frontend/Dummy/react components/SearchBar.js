import React from 'react';

const SearchBar = (props) => {
    return (
        <input 

        placeholder="Car Payment "
            value={props.term}
            onChange={(event) => {
                props.handleInput(event.target.value);
            }}
        />
    );
};

export default SearchBar;