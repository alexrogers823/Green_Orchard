import React from 'react';


const TopThree = props => {

  const monthDataSorted = props.expenses.slice().sort((a, b) => {
      const floatA = parseFloat(a[5]);
      const floatB = parseFloat(b[5]);
      return (floatB - floatA);
    }
  );

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
        <p>{monthDataSorted[0][3]}, {monthDataSorted[1][3]}, & {monthDataSorted[2][3]}</p>
      </div>
    );
  }
}

export default TopThree;
