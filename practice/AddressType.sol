// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract AddressType{
    //给合约冲Eth再部署
    constructor() public payable {

    }
    /*
        address-普通地址
        address payable - 可转账的地址
        获取地址余额：(address).balance;
        发送以太币，失败抛异常：(address payable).transfer(uint256); - gas:2300
        发送以太币，失败false:(address payable).send(uint256); - gas:2300
    */
    // 向x转账 - 从当前合约地址-> x的钱包地址
    function testTransfer(address payable x) public {
        address myAddress = address(this); // this是本合约的实例，相当于类型转换获得该合约地址
        uint xBalance = x.balance; // x余额
        uint myBalance = myAddress.balance; // 我的余额
        if(myBalance >= 10){// 满足条件给x转币
            x.transfer(1 ether);
        }
    }

    // 获取余额
    function getBalance() public view returns(uint){
        return address(this).balance; //返回单位为Wei
    }
}

// 0xa3A518Ba4e193Fb129aa379F5916d4660f15cE5D -> 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4