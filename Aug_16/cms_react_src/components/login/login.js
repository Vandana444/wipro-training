import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleLogin = async () => {
    try {
      const resp = await axios.get('https://localhost:7226/api/Customers'); // fetch all customers
      const customers = resp.data;
      const customer = customers.find(c => c.custUserName === username);

      if (!customer) {
        alert('Customer not found!');
        return;
      }

      if (customer.custPassword === password) {
        alert(`Welcome, ${customer.custName}!`);
        navigate('/dashboard', { state: { customer } }); // send customer info to Dashboard
      } else {
        alert('Invalid password!');
      }
    } catch (error) {
      console.error(error);
      alert('Error during login. Please try again.');
    }
  };

  return (
    <div>
      <h2>Customer Login</h2>
      <label>Username: </label>
      <input type="text" value={username} onChange={e => setUsername(e.target.value)} /><br /><br />
      <label>Password: </label>
      <input type="password" value={password} onChange={e => setPassword(e.target.value)} /><br /><br />
      <button onClick={handleLogin}>Login</button>
    </div>
  );
};

export default Login;
