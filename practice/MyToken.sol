// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; // semantic version

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20 {
    constructor() ERC20("ERC_BTC","EBTC") {
        // 发行1000个，因为合约不支持浮点数，所以乘以10的18次方
        _mint(msg.sender, 1000*10**18); // 
    }
}

contract MyContract{
    IERC20 public token;

    constructor(address _tokenAddr){
        token = IERC20(_tokenAddr);
    }

    //检查合约token余额
    function getTokenBalance()public view returns (uint256){
        return token.balanceOf(address(this));
    }
}