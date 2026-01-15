// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract BasicValueType {
    // 1 - 整型（int/unit）
    /*
      - (8-256位),每8字长增加，unit是unit256缩写
      - type(x).min()取最值 - 取得是类型的最值，不是数字的最值
      - 类型转化可以高转低，否则会丢失数据，或者不在意丢失数据可以强制转换

    */
    function testIntType() public pure returns(uint){
        uint8 a = 255;
        // - 取类型最值
        uint max = type(uint256).max;
        // - 类型转换
        uint8 x = 255;
        uint16 y = 257;
        x = uint8(y); // 将y的类型强制转换位unit8

        return max;
    }

    // 2- 枚举类型（enum）
    /*
        - 类似对象
        - 枚举最少1个成员，最多256个
        - 从0开始的无符号整型数
    */
    enum OrderState{ orderType, payType }

    function testEnum() public view returns(OrderState){
        OrderState state = OrderState.payType; // 输出1
        return  state;
    }
    
}