import React, { useState } from 'react';
import axios from 'axios';
import { useLocation } from 'react-router-dom';

const CreateCustomer = () => {
  const location = useLocation();
  const loggedInCustomer = location.state?.customer; // Get logged-in customer info

  const [data, setData] = useState({
    custId: 0,
    custName: '',
    custUserName: '',
    custPassword: '',
    city: '',
    state: '',
    email: '',
    mobileNo: ''
  });

  // Handle input changes
  const handleChange = (event) => {
    setData({
      ...data,
      [event.target.name]: event.target.value
    });
  };

  // Add customer function
  const addCustomer = () => {
    axios.post('https://localhost:7226/api/Customers', {
      custId: data.custId,
      custName: data.custName,
      custUserName: data.custUserName,
      custPassword: data.custPassword,
      city: data.city,
      state: data.state,
      email: data.email,
      mobileNo: data.mobileNo
    })
    .then((resp) => {
      alert(`Customer "${data.custName}" added successfully!`);
      console.log(resp.data);

      // Optional: clear the form after adding
      setData({
        custId: 0,
        custName: '',
        custUserName: '',
        custPassword: '',
        city: '',
        state: '',
        email: '',
        mobileNo: ''
      });
    })
    .catch((error) => {
      console.error(error);
      alert('Error adding customer. Please try again.');
    });
  };

  return (
    <div>
      <h2>Create / Add Customer</h2>

      {/* Show logged-in customer info */}
      {loggedInCustomer && (
        <div style={{ marginBottom: '20px', border: '1px solid #ccc', padding: '10px' }}>
          <h3>Logged-in Customer Info:</h3>
          <p>ID: {loggedInCustomer.custId}</p>
          <p>Name: {loggedInCustomer.custName}</p>
          <p>Username: {loggedInCustomer.custUserName}</p>
          <p>Email: {loggedInCustomer.email}</p>
          <p>City: {loggedInCustomer.city}</p>
          <p>State: {loggedInCustomer.state}</p>
          <p>Mobile: {loggedInCustomer.mobileNo}</p>
        </div>
      )}

      {/* Customer Form */}
      <label>Customer Id: </label>
      <input type="number" name="custId" value={data.custId} onChange={handleChange} /><br /><br />

      <label>Customer Name: </label>
      <input type="text" name="custName" value={data.custName} onChange={handleChange} /><br /><br />

      <label>Customer Username: </label>
      <input type="text" name="custUserName" value={data.custUserName} onChange={handleChange} /><br /><br />

      <label>Customer Password: </label>
      <input type="password" name="custPassword" value={data.custPassword} onChange={handleChange} /><br /><br />

      <label>City: </label>
      <input type="text" name="city" value={data.city} onChange={handleChange} /><br /><br />

      <label>State: </label>
      <input type="text" name="state" value={data.state} onChange={handleChange} /><br /><br />

      <label>Email: </label>
      <input type="email" name="email" value={data.email} onChange={handleChange} /><br /><br />

      <label>Mobile No: </label>
      <input type="text" name="mobileNo" value={data.mobileNo} onChange={handleChange} /><br /><br />

      <input type="button" value="Add Customer" onClick={addCustomer} />
    </div>
  );
};

export default CreateCustomer;
