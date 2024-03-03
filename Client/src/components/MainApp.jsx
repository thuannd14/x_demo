// eslint-disable-next-line no-unused-vars
import React from 'react'; 
import { useState } from 'react';

function MainApp() {
  const [isConnected, setIsConnected] = useState(false);

  const connectToMetaMask = async () => {
    try {
      
      if (window.ethereum) {
       
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        setIsConnected(true);
        
        console.log("Connected to MetaMask!");
      } else {
        console.log("Please install MetaMask to use this feature.");
      }
    } catch (error) {
      console.error("Error connecting to MetaMask:", error);
    }
  };

  return (
    <div className="App">
      <header className="App-header">
        {!isConnected ? (
          <div>
            <h2 className="">Connect to MetaMask</h2>
            <div className="w-20 h-10 bg-indigo-500 flex justify-center rounded-lg">
            <button onClick={connectToMetaMask}>Connect</button>
            </div>
          </div>
        ) : (
          <div>
            <h2>Connected to MetaMask</h2>
            <p>You can now interact with MetaMask.</p>
          </div>
        )}
      </header>
    </div>
  );
}

export default MainApp;