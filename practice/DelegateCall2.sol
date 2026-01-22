// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract A {
    uint public value;

    fallback() external payable { }

    function add(uint x) public {
        value += x;
    }
}

contract B{
    // delegatecall要用A中的变量，命名和顺序必须一致
    uint public value;

    // event BCaller(bool sucess,bytes _msg,address sender);
    // function addCall(address _addr)public {
    //     (bool success,bytes memory data) = _addr.call(
    //         abi.encodeWithSignature("add(uint)", 2)
    //     );
    //     emit BCaller(success,data,msg.sender);
    // }

    event BDelegateCaller(bool success,bytes _msg);
    function addDelegateCall(address _addr,uint _num)public {
        (bool success,bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("add(uint)",_num)
        );
        emit BDelegateCaller(success,data);
    }

    function getValue() public view returns (uint) {
        return value;
    }
}