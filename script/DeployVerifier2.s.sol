// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Verifier} from "../src/Verifier/Verifier2.sol";
import {console2} from "../lib/forge-std/src/console2.sol";

contract DeployScript is Script {
    Verifier public verifier;

    function setUp() public {}

    function run() public {
        vm.broadcast();
        verifier = new Verifier();
        console2.log("verifier1 address: ", address(verifier));
    }
}
