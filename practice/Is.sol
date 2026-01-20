// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract Counter1 {
    uint public count;

    function add() public  {
        count += 1;
    } 
    function getCount1() public view returns (uint){
        return count;
    }
}

// IsCounter1继承Counter1 -- 相当于将Counter1中的代码在这里执行，只是继承变量以及方法
contract IsCounter1 is Counter1 {
    function add2() public {
        count+= 2;
    }

    function getCount2() public view returns (uint){
        return count;
    }
}