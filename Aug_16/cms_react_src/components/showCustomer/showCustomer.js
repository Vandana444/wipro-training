import axios from 'axios';
import React, {Component, useEffect, useState} from 'react';

const ShowCustomer = () => {
  const[Customers,setCustomerData] = useState([])

 useEffect(() => {
    const fetchData = async () => {
      const response = await 
        axios.get("https://localhost:7226/api/Customers/");
        setCustomerData(response.data)
    }
    fetchData();
  },[])
  return (
    <div>
      <table border="3" align="center">
        <tr>
          <th>custId</th>
          <th>custName</th>
          <th>custUserName</th>
          <th>custPassword</th>
          <th>city</th>
          <th>state</th>
          <th>email</th>
          <th>mobileNo</th>
          
        </tr>
        {Customers.map((item) => 
        <tr>
          <td>{item.custId}</td>
          <td>{item.custName}</td>
          <td>{item.custUserName}</td>
          <td>{item.custPassword}</td>
          <td>{item.city}</td>
          <td>{item.state}</td>
          <td>{item.email}</td>
          <td>{item.mobileNo}</td>
        </tr>
      )}
      </table>
    </div>
  )
}

export default ShowCustomer;