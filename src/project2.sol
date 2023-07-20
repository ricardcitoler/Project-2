//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@solmate/tokens/ERC721.sol";
import "./counter.sol";

contract Project2 is ERC721, Counter {

    uint256 public totalSuppply;
    uint256 public priece = 0.1 ether;
    uint256 public nftMax = 10;
    
    //address uventada, tendria que ir la address del contrato Counter una vez hecho el deploy
    address contador = 0x5FbDB2315678afecb367f032d93F652f64180aa3; 

    error InsufficientBalance(uint256 available, uint256 required);

    constructor() ERC721("putito", "PUT") {}

    function tokenURI(uint256 id) public pure override returns (string memory) {
        return "";
}

    function mint(uint256 amount) public payable{
        require(msg.value >= priece * amount, "InsufficientBalance: Not enough Ether sent to purchase the token");
        require (balanceOf(msg.sender) + amount<= nftMax, "Cant mint more than 10 tokens");

        for (uint256 i; i < amount; i++){
            _mint(msg.sender, totalSuppply);
            totalSuppply++;
            }
    }

    function burn(uint256 id) public {
        require(ownerOf(id) == msg.sender, "You are not the owner of this token");
        _burn(id);

        (bool success, bytes memory data) = contador.call(
            abi.encodeWithSignature("increment()")
        );

        require(success, "Error incrementing the counter");
                }

    function setContador(address _contador) public {
        contador = _contador;
    }
}