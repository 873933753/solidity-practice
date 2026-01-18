// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract StructType {
    struct Person{
        string name;
        uint8 age;
        address account;
    }

    Person public somebody; // 定义变量

    function setSomebody(string calldata _name, uint8 _age, address _account) public {
        // somebody = Person(_name,_age,_account); // 创建变量 - 按顺序填进去
        // or 按具名填进去
        somebody = Person({name:_name,age:_age,account:_account});
    }

    function getSomebody()public view returns (string memory,uint8,address){
        // 用 .获取元素
        return (somebody.name,somebody.age,somebody.account);
    }
}