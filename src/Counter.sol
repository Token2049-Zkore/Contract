// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Verifier1.sol";
import "./Verifier2.sol";
import "./Verifier3.sol";
import "./Verifier4.sol";
import "./Verifier5.sol";

contract MyNFT is ERC1155, Ownable {
    constructor() ERC1155("https://myapi.com/api/token/{id}.json") {}

    function safeMint(
        address to,
        uint256 verifierType,
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[4] memory input
    ) public onlyOwner {
        uint256 tokenId;
        if (verifierType == 1) {
            require(
                Verifier1.verifyProof(a, b, c, input),
                "Failed Verifier1 verification"
            );
        } else if (verifierType == 2) {
            require(
                Verifier2.verifyProof(a, b, c, input),
                "Failed Verifier2 verification"
            );
        } else if (verifierType == 3) {
            require(
                Verifier3.verifyProof(a, b, c, input),
                "Failed Verifier3 verification"
            );
        } else if (verifierType == 4) {
            require(
                Verifier4.verifyProof(a, b, c, input),
                "Failed Verifier4 verification"
            );
        } else if (verifierType == 5) {
            require(
                Verifier5.verifyProof(a, b, c, input),
                "Failed Verifier5 verification"
            );
        } else {
            revert("Invalid verifier type");
        }

        tokenId = typeIdByVerifier(verifierType);
        _mint(to, tokenId, 1, "");
    }

    function burn(uint256 tokenId, uint256 amount) public {
        _burn(msg.sender, tokenId, amount);
    }

    function _transfer(
        address,
        address,
        uint256,
        uint256
    ) internal pure override {
        revert("Transfers are disabled");
    }

    function typeIdByVerifier(
        uint256 verifierType
    ) internal pure returns (uint256) {
        return verifierType; // You can define your own logic here to map verifierType to tokenId
    }
}
