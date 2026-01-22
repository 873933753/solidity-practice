// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract ReceiveContract {
    function getBalance() public view returns (uint){
        return address(this).balance; // 返回余额
    }

    event Recieived(address sender,uint value,string _msg);

    receive() external payable { }

    fallback() external payable {
        // 如果call中的函数不存在会出发fallback
        emit Recieived(msg.sender,msg.value,"fallback");
    }

    // _msg是传过来的字符串，对x进行+操作
    function add(string memory _msg, uint x) public payable returns (uint){
        // payable才能访问msg.value
        emit Recieived(msg.sender,msg.value,_msg);
        return x + 1;
    }
}

contract Caller{
    event Ca(bool success,bytes data);

    // 调用上面合约的add,_addr上面合约的地址
    function CallAdd(address payable _addr) public payable {
        //参数可选，转账金额,最大消耗gas
        //call返回参数 success-是否调用成功,data-返回的参数x+1
        (bool success,bytes memory data) = _addr.call{value:msg.value}(
            //用abi方式调用add,并传参
            abi.encodeWithSignature("add(string,uint)","caller add",12345)
        );
        emit Ca(success,data);
    }
}