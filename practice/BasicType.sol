// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract BasicType {
    // 布尔类型
    /*
        比较运算：==，!=
        逻辑运算：!(取反)，&&（且），||(或)
    */
    bool public isShow = true;
    bool public isChanged = false;
    

    function SetShow(bool flag) public {
        isShow = flag;
        if(isShow || tryChange()){ // isShow为false才执行tryChange，如果为true-短路

        }
    }

    function tryChange() internal returns (bool) {
        isChanged = !isChanged; //取反
        return isChanged;
    }

    // 整型
    uint a = 1;
    function getUintMax() public pure returns(uint){
        return type(uint).max;
    }
}