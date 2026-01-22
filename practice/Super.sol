// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract Counter1 {
    uint public count;

    function add() public  {
        count += 1;
    } 
    function getCount1() public view returns (uint){
        return count;
    }
    // virtual - 表示该函数可以被重写
    function multi() public virtual {
        count = count*2 ; 
    }
}

// IsCounter1继承Counter1 -- 相当于将Counter1中的代码在这里执行，只是继承变量以及方法
contract IsCounter1 is Counter1 {
    function add2() public {
        // 调用父合约的add函数 super.函数名()
        super.add();
    }

    function getCount2() public view returns (uint){
        return count;
    }

    // overide-重写父合约-表示该函数是重写的
    function multi() public override {
        count = count*3;
    }
}


