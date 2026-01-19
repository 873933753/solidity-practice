// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract testError {
    /*
        发生错误抛出异常
        1、条件检查，抛出异常
        assert（）：panic，对应错误的代码
        require(条件，抛出提示)
        2、revert('xxx'),终止运行并撤销状态更改
        3、error定义错误，revert error()抛出错误
    */

    address owner;

    error NotOwner();
    uint x;

    constructor() {
        owner = msg.sender;
    }


    function doSomething() public view  {
        // 更推推荐的做法gas - 23388
        // if(msg.sender != owner) revert NotOwner();  // 23388

        require(msg.sender == owner, "Not owner 00000000000000");   // 23642
        // x += 1;

        // assert(x > 0);
    }
}