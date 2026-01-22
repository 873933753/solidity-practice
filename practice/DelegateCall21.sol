// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract A {
    uint public num;
    uint public value;

    function setVars(uint _num) public payable  {
        num = _num;
        value = msg.value;
    }
}

contract B{
    // delegatecall要用A中的变量，命名和顺序必须一致
    uint public num;
    uint public value;
    address public a;

    function setVarsB(uint _num)public payable {
        (bool success,bytes memory data) = a.delegatecall(
            // 这里只是uint会调用不成功
            abi.encodeWithSignature("setVars(uint256)",_num)
        );
    }

    function setA(address _a) external {
        a = _a;
    }
}