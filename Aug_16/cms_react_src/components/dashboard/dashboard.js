import React from 'react';
import { Link, Outlet, useLocation } from 'react-router-dom';

const Dashboard = () => {
  const location = useLocation();
  const customer = location.state?.customer;

  return (
    <div>
      <h2>Welcome, {customer?.custName}</h2>

      {/* Show customer info by default */}
      {customer && (
        <div style={{ border: '1px solid gray', padding: '10px', marginBottom: '20px' }}>
          <h3>Your Information</h3>
          <p><strong>ID:</strong> {customer.custId}</p>
          <p><strong>Name:</strong> {customer.custName}</p>
          <p><strong>Username:</strong> {customer.custUserName}</p>
          <p><strong>Password:</strong> {customer.custPassword}</p>
          <p><strong>City:</strong> {customer.city}</p>
          <p><strong>State:</strong> {customer.state}</p>
          <p><strong>Email:</strong> {customer.email}</p>
          <p><strong>Mobile:</strong> {customer.mobileNo}</p>
        </div>
      )}

      {/* Navigation Menu */}
      <nav style={{ marginBottom: '20px' }}>
        <Link to="/dashboard/create-customer" style={{ marginRight: '10px' }}>Create Customer</Link>
        <Link to="/dashboard/search-customer" style={{ marginRight: '10px' }}>Search Customer</Link>
        <Link to="/dashboard/search-customer-username" style={{ marginRight: '10px' }}>Search by Username</Link>
        <Link to="/dashboard/show-customer">Show All Customers</Link>
      </nav>

      {/* Nested page content */}
      <Outlet />
    </div>
  );
};

export default Dashboard;
