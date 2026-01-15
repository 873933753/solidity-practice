// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract ComflexValueType {
    // 3 - addrress 钱包地址或者合约地址
    // 钱包地址
    function testAddress() public view returns (address){
        // msg.sender 是从上下文取合约调用者的地址（即部署合约的这个account）
        address account = msg.sender;
        return account;
    }
    // 合约地址
    function testMyAddress() public view returns (address){
        address addr = address(this);
        return addr;
    }
    // 0x5A86858aA3b595FD6663c2296741eF4cd8BC4d01

    // 4 - contract Type
    function testContract() public view {
        ComflexValueType mycontract = this;
    }

    // 5 - FixedByteArray
    function testFixedByteArray() public pure returns (bytes3){
        bytes3 data = 0x111111;
        return data;
    }

    function testFixedByteArray1() public pure returns (uint){
        bytes3 data = 0x111111;
        bytes1 first = data[0];
        uint256 l =data.length;
        return l;
    }
}