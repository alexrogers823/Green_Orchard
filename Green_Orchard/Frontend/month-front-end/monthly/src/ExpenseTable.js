import React from 'react';

const ExpenseTable = props => {
  return (
    <div className="ExpenseTable">
      <table className="TableHeaders">
        <thead>
          <tr key={0}>
            <th>Date</th>
            <th>Expense</th>
            <th>Category</th>
            <th>Amount</th>
          </tr>
        </thead>
        <tbody>
          {_makeTable(props.month, props.expenses)}
        </tbody>
      </table>
    </div>
  );
}

function _makeTable(month, expenses) {
  const table = expenses.map((exp, i) => {
    return (
      <tr key={i+1}>
        <td>{month}</td>
        <td>{exp.Expense}</td>
        <td>{exp.Category}</td>
        <td>{exp.Cost}</td>
      </tr>
    )
  }).reverse();

  return table;
}

export default ExpenseTable;
