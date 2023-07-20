//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count = 0;
    address public proyecto2 = address(0);

    function increment() public {
        count++;
    }

    function setProyecto2(address _proyecto2) public {
        proyecto2 = _proyecto2;
    }

}