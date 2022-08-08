// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Deposit {
    address private constant usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    uint256 public depositCount;

    error InsufficientBalance();

    function deposit(uint256 amount) external {
        require(amount > 0, "!amount");
        if (IERC20(usdt).balanceOf(msg.sender) < amount) {
            revert InsufficientBalance();
        }
        IERC20(usdt).transferFrom(msg.sender, address(this), amount);
        unchecked {
            depositCount++;
        }
    }
}
