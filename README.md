# m4-final
# DegenToken Smart Contract

This is the README file for the DegenToken smart contract. The DegenToken is an ERC20 token that implements additional functionalities to support non-fungible tokens (NFTs) representing market items. It allows users to create, buy, and own unique market items using the DegenToken.

This repository houses the Solidity smart contract named "DegenToken," which serves as a decentralized application (DApp) for a simple token-based marketplace. The contract effectively fulfills the following key functionalities:

1. **Minting New Tokens**: The platform can generate new tokens and allocate them as rewards to players. Only the contract owner possesses the authority to mint tokens, ensuring a controlled token supply.

2. **Transferring Tokens**: Players have the flexibility to transfer their tokens to other participants within the system, promoting peer-to-peer token exchange.

3. **Redeeming Tokens**: Players can seamlessly redeem their accumulated tokens to obtain items available in the in-game store, facilitating a rewarding and engaging gaming experience.

4. **Checking Token Balance**: At any given time, players can conveniently check their token balance, providing them with real-time visibility of their token holdings.

5. **Burning Tokens**: The contract allows anyone to burn their own tokens that are no longer needed. This process helps in removing tokens from circulation, if desired, thereby contributing to the overall token economy's stability.

By encompassing these essential functionalities, the DegenToken smart contract empowers users to participate actively in the token-based store, fostering a vibrant and interactive gaming ecosystem.

## Introduction

DegenToken is an ERC20 token that extends the standard ERC20 functionality to provide non-fungible tokens (NFTs) representing various market items. Each market item is uniquely identified by an item ID and has a name and price associated with it. Users can interact with the smart contract to view available market items, buy them using Degen tokens, and keep track of the items they own.

## Getting Started

To use the DegenToken smart contract, you need to have the required development environment set up. Make sure you have:

- A development environment with Solidity compiler support (version 0.8.9 or compatible).
- Access to the OpenZeppelin contracts library.

## Smart Contract Overview

The DegenToken smart contract is implemented in Solidity and inherits from the following contracts:

- `ERC20`: This contract implements the ERC20 standard functionality for a fungible token.
- `ERC20Burnable`: This contract extends ERC20 to allow tokens to be burned by the owner.
- `Ownable`: This contract provides basic authorization control and restricts some functions to the contract owner.

The smart contract introduces three main concepts:

1. Market Item: A struct representing a market item, containing its item ID, name, and price.
2. Market Items Mapping: A mapping to store the market items by their item ID.
3. My Items Mapping: A mapping to store the items owned by each address and their respective quantities.

## Functionality

The DegenToken smart contract offers the following functionalities:

1. **Minting**: The contract owner can create new Degen tokens and assign them to a specified address.

2. **Adding Market Items**: The contract owner can add new market items to the contract during deployment. These items will be available for users to purchase.

3. **Viewing Market Items**: Users can view all available market items and their details, such as name and price.

4. **Buying Market Items**: Users can purchase market items using their Degen tokens. The tokens will be transferred from the buyer to the contract owner, and the buyer will own the purchased item.

5. **Viewing Owned Items**: Users can view the market items they own and their respective quantities.

## Testing

The DegenToken smart contract should be thoroughly tested in a development or test environment before deployment to a live network. The OpenZeppelin Test Helpers library or other testing frameworks can be used to write and run unit tests for the contract.

## Contributing

Contributions to the DegenToken smart contract are welcome. If you find a bug, have a suggestion, or want to propose a new feature, feel free to open an issue or submit a pull request. Please follow the established coding style and guidelines.

## License

The DegenToken smart contract is distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Authors
Eiron Maningat
