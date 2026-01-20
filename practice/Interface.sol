// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

// 声明接口，用于调用其他合约中的方法
interface MyCounter {
    function add() external ; // 声明add可以外部调用（合约Counter中的）
    function count() external view returns (uint);
}

contract Counter {
    uint public count;

    function add() external {
        count += 1;
    }
}

contract Interface {
    function addA(address _counterA) external {
        // 其实等同于 Counter c;  c.add()
        MyCounter(_counterA).add();
    }

    function getCount(address _counterA) public view returns (uint){
        // 调用Counter中的count
        return MyCounter(_counterA).count();
    }
}