import React from 'react';


const TopThree = props => {

  const monthDataSorted = props.expenses.slice().sort((a, b) => b.Cost - a.Cost);

  console.log(monthDataSorted[0]);
  if (!monthDataSorted[0]) {
    return (
      <div>
        <h1>Loading...</h1>
      </div>
    );
  } else {
    return (
      <div className="TopThree">
        <h4>Your Top 3 Expenses from {props.month} are:</h4> 
        <p>{monthDataSorted[0].Expense}, {monthDataSorted[1].Expense}, & {monthDataSorted[2].Expense}</p>
      </div>
    );
  }
}

export default TopThree;
