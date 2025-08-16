import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import Login from './components/login/login';
import Dashboard from './components/dashboard/dashboard';
import CreateCustomer from './components/createCustomer/createCustomer';
import SearchCustomer from './components/searchCustomer/searchCustomer';
import SearchCustomerUserName from './components/searchCustomerUserName/searchCustomerUserName';
import ShowCustomer from './components/showCustomer/showCustomer';

function App() {
  return (
    <Router>
      <div className="App">
        <h1>CUSTOMER INFO</h1>
        <Routes>
          {/* Login */}
          <Route path="/" element={<Login />} />

          {/* Dashboard with nested routes */}
          <Route path="/dashboard" element={<Dashboard />}>
            <Route path="create-customer" element={<CreateCustomer />} />
            <Route path="search-customer" element={<SearchCustomer />} />
            <Route path="search-customer-username" element={<SearchCustomerUserName />} />
            <Route path="show-customer" element={<ShowCustomer />} />
          </Route>

          {/* Redirect unknown routes */}
          <Route path="*" element={<Navigate to="/" />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
