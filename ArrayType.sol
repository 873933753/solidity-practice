// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract ArrayType{
    // 成员变量都是存在storage中的
    // 定义静态数组
    uint8[3] data;
    // 引用类型一定要有存贮的位置（memory，storage，calldata）
    // 共有函数public只能存memory
    // internal可以用storage，public的只能拷贝到memory中，storage是持久存储的，外部不可直接存
    function testStaticArray() public view returns(uint8[3] memory){
        // 存在storage中的data拷贝到memory中在作为数据返回的
        return data;
    }

    // 动态数组
    // 定义动态数组
    uint8[] ddata;
    function testReadDynamicArray()public view returns (uint8[] memory){
        return ddata;
    }

    function testWriteDynamicArray() public{
        ddata.push(12);
        ddata.pop(); // 12出栈
        ddata.push(34); // 最后结果是34入栈
    }

    // 内存中的动态数组
    function testMemoryDynamicArray(uint8 size)public pure returns (uint8[] memory){
        uint8[] memory mdata = new uint8[](size); // 定义内存中的动态数组，不能再push
        return mdata;
    }

}