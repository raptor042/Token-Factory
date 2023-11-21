// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./Token.sol";

contract TokenFactory {
    address[] public tokens;

    event CreateToken(address indexed token, address indexed owner);

    constructor() public {}

    function createToken(
        string memory _NAME, 
        string memory _SYMBOL, 
        uint256 _supply, 
        uint256 _txFee,
        uint256 _lpFee,
        uint256 _MAXAMOUNT,
        uint256 SELLMAXAMOUNT,
        address routerAddress,
        address tokenOwner
    ) public {
        Token token = new Token(
            _NAME, 
            _SYMBOL, 
            _supply, 
            _txFee,
            _lpFee,
            _MAXAMOUNT,
            SELLMAXAMOUNT,
            routerAddress,
            tokenOwner
        );

        tokens.push(address(token));

        emit CreateToken(address(token), tokenOwner);
    }
}