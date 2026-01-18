// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract EnumType{
    /*
        枚举类型 - enum
        - 最多255个成员
        - 成员从0开始
    */
    enum Color { White, Red, Yellow }
    Color obj;

    function setColor(Color c) public {
        obj = c;
    }

    function getColor() public view returns (Color){
        return obj;
    }
}