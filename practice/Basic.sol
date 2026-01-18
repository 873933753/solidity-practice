// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract Basic {
    /*
        变量 
        - 可见性：public、private、internal（内以及继承）
        - 可变状态：constant、immutable
    */
    // 定义状态变量，是存在storage中的
    uint count = 0; 
    uint public constant num1 = 1; //声明了以后就不能再改动了
    uint public immutable num2; //在constructor中赋值，不能再改动

    constructor(uint t){
        num2 = t;
    }

    function getNum() public view  returns (uint) {
        uint count2 = 6;//定义本地变量，是存在memory中的，函数运行完成即释放
        return num2;
    }
}