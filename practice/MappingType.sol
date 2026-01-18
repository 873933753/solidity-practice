// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract MappingType {
    //映射账户 余额
    mapping (address => uint) public balances;

    // 更新发送者的余额
    function update(uint num) public {
        balances[msg.sender] = num;
    }

    // mapping和struct结合使用
    struct Person{
        address acount;
        uint8 age;
    }

    // struct作为mapping的ValueType
    mapping (uint => Person) public persons;

    function setPersons(uint id,uint8 _age)public {
        persons[id] = Person({age:_age,acount:msg.sender});
    }

    function getPersons(uint id) public view returns(Person memory){
        return persons[id];
    }
}