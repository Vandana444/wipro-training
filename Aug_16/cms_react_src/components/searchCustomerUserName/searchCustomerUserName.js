import axios from 'axios';
import React, { useState } from 'react';

const SearchCustomer = () => {
    const [CustomerResult, SetCustomerResult] = useState({});
    const [custUserName, SetCustUserName] = useState(""); 

    const handleChange = event => {
        SetCustUserName(event.target.value);
    }

    const show = () => {
        axios.get("https://localhost:7226/api/Customers/byusername/" + custUserName)
            .then((response) => {
                SetCustomerResult(response.data);
            })
            .catch((error) => {
                SetCustomerResult({}); // clear if not found
                alert("Customer not found");
            });
    }

    return (
        <div>
            <label>Username : </label>
            <input 
                type="text" 
                name="custUserName"
                value={custUserName} 
                onChange={handleChange} 
            /> 
            <br/>
            <input type="button" value="Show" onClick={show} />
            <hr/>
            {CustomerResult.custId && (
                <div>
                    custId : <b>{CustomerResult.custId}</b> <br/>
                    custName : <b>{CustomerResult.custName}</b> <br/>
                    custUserName : <b>{CustomerResult.custUserName}</b> <br/>
                    custPassword : <b>{CustomerResult.custPassword}</b> <br/>
                    city : <b>{CustomerResult.city}</b> <br/>
                    state : <b>{CustomerResult.state}</b> <br/>
                    email : <b>{CustomerResult.email}</b> <br/>
                    mobileNo : <b>{CustomerResult.mobileNo}</b> <br/>
                </div>
            )}
        </div>
    );
}

export default SearchCustomer;
