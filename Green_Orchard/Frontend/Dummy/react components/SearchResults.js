import React from 'react';

const Result = (expense) => {
    return (
        <li>{expense}</li>
    );
};

const SearchResults = (props) => {
    return (
        <ul className="results">
            {props.results.map(Result)}
        </ul>
    );
};

export default SearchResults;