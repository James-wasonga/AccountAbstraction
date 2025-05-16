// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SmartWallet
 * @dev Basic wallet simulating EIP-4337 functionalities
 */
contract SmartWallet {
    address public owner;
    uint256 public nonce;

    event Executed(address to, uint256 value, bytes data);
    event Validated(address user, uint256 nonce);

    constructor(address _owner) {
        owner = _owner;
    }

    /**
     * @dev Executes a call to another contract or sends ETH.
     * @param to Target address.
     * @param value Amount of ETH to send.
     * @param data Encoded function call data.
     */
    function execute(address to, uint256 value, bytes calldata data) external {
        require(msg.sender == owner, "Not authorized");
        nonce++;

        (bool success, ) = to.call{value: value}(data);
        require(success, "Execution failed");

        emit Executed(to, value, data);
    }

    /**
     * @dev Simulates signature validation logic.
     * @param user The address that signed the operation.
     */
    function validateUserOp(address user) external view returns (bool) {
        // Simplified validation check (in real case use ECDSA)
        require(user == owner, "Invalid signature");
        return true;
    }

    receive() external payable {}
}
