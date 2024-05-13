//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
// import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * It also allows the owner to withdraw the Ether in the contract
 * @author BuidlGuidl
 */
contract EthBridge {
    address payable public zkSyncAddress; // zkSync contract address

    event Deposit(address indexed user, uint256 amount);

    constructor(address payable _zkSyncAddress) {
        zkSyncAddress = _zkSyncAddress;
    }

    // Function to deposit ETH into zkSync
    function deposit() external payable {
        // Send ETH to zkSync contract
        zkSyncAddress.transfer(msg.value);
        
        // Emit event
        emit Deposit(msg.sender, msg.value);
    }
}