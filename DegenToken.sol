// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UniqueToken is ERC20, Ownable {
    constructor() ERC20("Unique", "UNQ") {
        _mint(msg.sender, 10000 * 10**18); // Initialize with 10,000 UNQ tokens for the contract creator
    }

    function mintTokens(address account, uint256 tokenAmount) public onlyOwner {
        _mint(account, tokenAmount);
    }

    function transferTokensTo(address recipient, uint256 tokenAmount) public {
        require(recipient != address(0), "Invalid address");
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");
        _transfer(msg.sender, recipient, tokenAmount);
    }

    function redeemOwnedTokens(uint256 tokenAmount) public {
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");
        // Implement redemption logic here, e.g., item purchase
        _burn(msg.sender, tokenAmount);
    }

    function burnOwnedTokens(uint256 tokenAmount) public {
        require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");
        _burn(msg.sender, tokenAmount);
    }
}
