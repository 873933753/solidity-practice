// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

contract StorageVariable{
    int256[] arr1;
    int256[] arr2;

    function getArr1() public view returns (int256[] memory){
        return  arr1;
    }
    function getArr2() public view returns (int256[] memory){
        return  arr2;
    }

    function setArr1(int256 num) public {
        arr1.push(num);
    }
    function setArr2(int256 num) public {
        arr2.push(num);
    }

    // 1、arr1和arr2都是成员变量，所以只能值拷贝
    function setArr1ToArr2() public {
        arr2 = arr1;
    }

    // 2、location不同，只能值拷贝
    function testSecondRule() public view returns(int256[] memory){
        int256[] memory arr;
        arr = arr1;
        return arr;
    }

}

