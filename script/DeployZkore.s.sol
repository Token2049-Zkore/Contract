// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Zkore} from "../src/Zkore.sol";
import {console2} from "../lib/forge-std/src/console2.sol";

contract DeployScript is Script {
    address constant verifier1 = 0x025805e096E8d18670b784bD7e0C89567b0C9965;
    address constant verifier2 = 0x1DE82c6F836ab8f0e34e4632c04f9f9A075891cb;
    address constant verifier3 = 0x508A6f64a692046D41c23Da376dC3daff8c856B3;
    address constant verifier4 = 0xaAC3bEF2AB4DeD75aa7eAB6C3E860A311e14eDc6;
    address constant verifier5 = 0xf19B762e1bFD8a03db6E26017d3eDB98aC8eF6D8;

    function setUp() public {}

    function run() public {
        vm.broadcast();
        Zkore zkore = new Zkore(
            verifier1,
            verifier2,
            verifier3,
            verifier4,
            verifier5
        );
        console2.log("Zkore address: ", address(zkore));
    }
}
