// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract StructType {
    struct Person {
        string name;
        uint8 age;
        Home home;
    }

    struct Home{
        string province;
        string city;
        string addr;
    }

    Person master;

    // struct作为返回值
    function testReadStruct() public view returns (Person memory){
        return master;
    }
    
    // struct作为参数
    function testWriteStruct(Person memory p) public {
        master = p;
    }
    function testWriteStructValue(string memory name)public {
        master.name = name;
    }

    
}