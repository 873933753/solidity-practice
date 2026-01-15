// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract constructStructure { // 合约名 -constructStructure
    // 1- 成员变量
    /*
      成员变量
      类型 - （可见性）-变量名
      可见性：internal（默认-子合约可见）、private（本合约可见）、public（所有可见）
     */
     uint256 public balance;
     
     // 状态变量的可见性为public，系统会自动给它生成一个为public的可见的读函数的balance函数，所以会出现按钮
     function balance1() public view returns(uint256) {
        return balance;
     }

     // 5 - 构造函数 - constructor
     /*
        合约函数链上部署时执行
     */
     constructor(uint256 _initBalance){
        balance = _initBalance;
     }

     // 2 - 合约函数 function
     /*
        函数名(参数) [可见性][相关交易][..] [returns] (返回值)

        可见性：public、private、internal、external（无默认值）
        相关交易：写操作（五关键字就是写操作）、view（读函数）、pure（纯函数）

     */
     // 写函数 - public会向链上进行操作，需要广播给所有的节点
     function AddBalance (uint256 num) public LimitRange(num){
        uint256 oldBalance = balance;
        balance += num;
        emit BalanceAdded(oldBalance, num);
     }

     //3 - 事件 event 
     /*
        用来记录所发生的重要的事情（执行合约写操作时发生的），在函数中使用
        event定义，emit 触发,log中会有输出
     */
     // 记录balance加之前的值，和加的值
     event BalanceAdded(uint256 oldBalance, uint256 num);

     // 4 -合约函数修饰器 - modifier
     /*
        修饰器是对合约函数的输入输出进行约束的
     */
    modifier LimitRange(uint256 num){
        // 需要num大于100，否则报错
        require(num > 100, 'too small');
        _;
    }

}