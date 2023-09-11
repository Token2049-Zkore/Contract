# Zkore Smart Contract Documentation

## Config

- Network: mumbai
- Chain Id: 80001
- RPC URL: https://polygon-mumbai-bor.publicnode.com

## Contract Address

| Contract   | Address                                    | Chain  | Link                                                                                                 |
| :--------- | :----------------------------------------- | :----- | :--------------------------------------------------------------------------------------------------- |
| Verifier01 | 0x025805e096E8d18670b784bD7e0C89567b0C9965 | Mumbai | [Verifier01](https://mumbai.polygonscan.com/address/0x025805e096E8d18670b784bD7e0C89567b0C9965#code) |
| Verifier02 | 0x1DE82c6F836ab8f0e34e4632c04f9f9A075891cb | Mumbai | [Verifier02](https://mumbai.polygonscan.com/address/0x1DE82c6F836ab8f0e34e4632c04f9f9A075891cb#code) |
| Verifier03 | 0x508A6f64a692046D41c23Da376dC3daff8c856B3 | Mumbai | [Verifier03](https://mumbai.polygonscan.com/address/0x508A6f64a692046D41c23Da376dC3daff8c856B3#code) |
| Verifier04 | 0xaAC3bEF2AB4DeD75aa7eAB6C3E860A311e14eDc6 | Mumbai | [Verifier04](https://mumbai.polygonscan.com/address/0xaAC3bEF2AB4DeD75aa7eAB6C3E860A311e14eDc6#code) |
| Verifier05 | 0xf19B762e1bFD8a03db6E26017d3eDB98aC8eF6D8 | Mumbai | [Verifier05](https://mumbai.polygonscan.com/address/0xf19B762e1bFD8a03db6E26017d3eDB98aC8eF6D8#code) |
| Zkore      | 0x953CEBe0599C7Ad53e964BfbC1e52b5ab3db818e | Mumbai | [Zkore](https://mumbai.polygonscan.com/address/0x953CEBe0599C7Ad53e964BfbC1e52b5ab3db818e#code)      |

## Contract ABI

Zkore ABI: [link](Zkore.json)

## Contract Functions

### createEvent

`createEvent` allows owner to set up events with entry restrictions, like requiring a Twitter score of at least 100.

Stores the `verifierType` against the next `tokenId` to be minted.

```solidity
function createEvent(
    string memory name,
    uint256 verifierType
) public onlyOwner
```

### mintEventTicket

`mintEventTicket` lets users register for events by providing proof of meeting the organizer's criteria, such as a verified Twitter score.

Mints a new ticket after successful verification through the appropriate verifier, this ticket can't be transferred.

```solidity
function mintEventTicket(
    uint256 tokenId,
    uint256[7] calldata instances,
    bytes calldata proof
) public
```
