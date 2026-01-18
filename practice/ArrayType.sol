// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract ArrayType {
    //合约变量 - 默认存储storage中
    uint8[3] numbers = [1,2,3]; // 定长数组
    uint8[] types; // 不定长数组

    function getNumber() public view returns(uint8){
        return numbers[1]; //获取数组元素
    }

    function setNumber(uint8 a)public {
        numbers[1] = a;
    }

    function pushType(uint8 a) public {
        // 边长才能用push
        types.push(a);
    }

    function getTypes() public view  returns (uint8[] memory){
        // 函数内部变量 - 存在memory中
        uint8[] memory a = types;
        return a;
    }

    function copy(uint8 a)public {
        uint8[] storage b = types; //此时b也是storage，若改了b，types也会改，深拷贝
        b[1] = a;
    }
}