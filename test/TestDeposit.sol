// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Deposit.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ContractTest is Test {
    address public usdtWhale = 0xF977814e90dA44bFA03b6295A0616a897441aceC; // binance8 address
    address public usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    uint256 amount = 1000e6;
    Deposit depositcontract;

    function setUp() public {
        depositcontract = new Deposit();
    }

    function testDeposit() public {
        vm.startPrank(usdtWhale);
        IERC20(usdt).approve(address(depositcontract), amount);
        depositcontract.deposit(amount);
        assertEq(IERC20(usdt).balanceOf(address(depositcontract)), amount);
    }
}
