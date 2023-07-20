//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/token/ERC721/ERC721.sol";

contract Project2 is ERC721 {

    uint256 totalSuppply;
    uint256 priece = 0.1 ether;

    error InsufficientBalance(uint256 available, uint256 required);

    constructor() ERC721("putito", "PUT") {}

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
}

    function mint(uint256 amount) public payable{
        require(msg.value >= priece * amount, "InsufficientBalance: Not enough Ether sent to purchase the token");

        for (uint256 i = 0; i < amount; i++){
            _mint(msg.sender, totalSuppply);
            totalSuppply++;
            }
    }

}