// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract Modifier {
    //如限制给特定用户转
    address public owner;
    uint private balance = 0; // 余额

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwer(){
        require(owner == msg.sender,'is not Owner');
        _;
    }

    function transferOwner(address _new) public onlyOwer{
        owner = _new;
    }

    modifier over22(uint age) {
        require (age >= 22, "too small age");
        _;
    }


    function marry(uint age) public over22(age) {
       // do something
    }

    function marry2(uint age) public payable over22(age) {
        balance += msg.value;
    }
}