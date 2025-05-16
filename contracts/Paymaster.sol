// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Paymaster
 * @dev Simulates a paymaster that logs sponsored gas payments
 */
contract Paymaster {
    event GasSponsored(address user, uint256 gasAmount);

    function sponsorGas(address user, uint256 gasAmount) external {
        emit GasSponsored(user, gasAmount);
    }
}
