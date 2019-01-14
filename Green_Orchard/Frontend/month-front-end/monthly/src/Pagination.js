import React from 'react';

const PageButtons = props => {
    return (
        <div>
            <h3>Cycle Between Months:</h3>
            <button className="Pagination" onClick={() => {
                props.handleDecrease()
            }}>
                <i class="fas fa-arrow-alt-circle-left"></i>
            </button>
            <button className="Pagination" onClick={() => {
                props.handleIncrease()
            }}>
                <i class="fas fa-arrow-alt-circle-right"></i>
            </button>
        </div>
    );
};

export default PageButtons;