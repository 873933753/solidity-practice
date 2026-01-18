// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract ContractType {
  uint public counter;
  address public addr;

  constructor() {
      counter = 0;
  }

  // "0x06661abd"
  function count() public {
      counter = counter + 1;
      addr = msg.sender;
  }
    // 0xb8e010de
  function set() public {
      counter = counter + 5;
  }
}

contract testContract {
	function newCall() public  {
		Counter c = new Counter();
		c.count();
	}

    function newCall2(Counter c) public  {
		c.count();
	}

}