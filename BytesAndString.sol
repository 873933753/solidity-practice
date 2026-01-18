// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract BytesAndString{
    // 初始化方式1
    string name = "string1";
    bytes name1 = "bytes1";

    // 初始化方式2
    // 这种方式string不可修改，bytes可以修改
    string str = new string(5);
    bytes str1 = new bytes(5);

    function testStringAndBytes() public view returns (string memory){
        string memory data = "data";
        bytes memory data1 = "data1";

        // 不同location的memory拷贝
        data = name;
        data1 = name1;

        // 类型转换
        data =string(data1);
        data1 = bytes(data);

        //下标访问
        bytes1 b = data1[0];
        data1[0]= 0x88;
        return data;
    }
}