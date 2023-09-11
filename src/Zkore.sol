// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC1155} from "openzeppelin/token/ERC1155/ERC1155.sol";
import {Ownable} from "openzeppelin/access/Ownable.sol";

interface Verifier {
    function verify(
        uint256[7] calldata instances,
        bytes calldata proof
    ) external returns (bool);
}

contract Zkore is ERC1155, Ownable {
    uint256 public counter;

    Verifier public Verifier1;
    Verifier public Verifier2;
    Verifier public Verifier3;
    Verifier public Verifier4;
    Verifier public Verifier5;

    mapping(uint256 => uint256) public verifierTypeByTokenId;

    struct ZKEvent {
        string name;
        uint256 verifierType;
        uint256 tokenId;
    }

    ZKEvent[] public events;

    constructor(
        address verifier1,
        address verifier2,
        address verifier3,
        address verifier4,
        address verifier5
    ) public ERC1155("https://myapi.com/api/token/{id}.json") {
        Verifier1 = Verifier(verifier1);
        Verifier2 = Verifier(verifier2);
        Verifier3 = Verifier(verifier3);
        Verifier4 = Verifier(verifier4);
        Verifier5 = Verifier(verifier5);
    }

    function setVerifier(
        address verifier1,
        address verifier2,
        address verifier3,
        address verifier4,
        address verifier5
    ) public onlyOwner {
        Verifier1 = Verifier(verifier1);
        Verifier2 = Verifier(verifier2);
        Verifier3 = Verifier(verifier3);
        Verifier4 = Verifier(verifier4);
        Verifier5 = Verifier(verifier5);
    }

    function createEvent(
        string memory name,
        uint256 verifierType
    ) public onlyOwner {
        verifierTypeByTokenId[counter] = verifierType;
        events.push(ZKEvent(name, verifierType, counter));
    }

    function mintEventTicket(
        uint256 tokenId,
        uint256[7] calldata instances,
        bytes calldata proof
    ) public {
        uint256 verifierType = verifierTypeByTokenId[tokenId];
        bool verificationStatus;

        if (verifierType == 1) {
            verificationStatus = Verifier1.verify(instances, proof);
        } else if (verifierType == 2) {
            verificationStatus = Verifier2.verify(instances, proof);
        } else if (verifierType == 3) {
            verificationStatus = Verifier3.verify(instances, proof);
        } else if (verifierType == 4) {
            verificationStatus = Verifier4.verify(instances, proof);
        } else if (verifierType == 5) {
            verificationStatus = Verifier5.verify(instances, proof);
        } else {
            revert("Invalid verifierType");
        }

        require(verificationStatus, "Proof verification failed");

        _mint(msg.sender, tokenId, 1, "");
    }

    function burn(uint256 tokenId, uint256 amount) public {
        _burn(msg.sender, tokenId, amount);
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal pure override {
        require(
            from == address(0) || to == address(0),
            "This a Soulbound token. It cannot be transferred. It can only be burned by the token owner."
        );
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }
}
