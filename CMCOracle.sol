pragma solidity ^0.5.16;

contract CMCOracle {
  // Contract owner
  address public owner;

  // BTC Marketcap Storage
  uint public planqprice;

  // Callback function
  event CallbackGetplanqprice();

  constructor() public {
    owner = msg.sender;
  }

  function updatePlanqprice() public {
    // Calls the callback function
    emit CallbackGetPlanqprice();
  }

  function setPlanqprice(uint price) public {
    // If it isn't sent by a trusted oracle
    // a.k.a ourselves, ignore it
    require(msg.sender == owner);
    planqprice = price;
  }

  function getPlanqprice() view public returns (uint) {
    return planqprice;
  }
}
