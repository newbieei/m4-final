# DegenToken

DegenToken is an ERC-20 token smart contract written in Solidity. It allows players to interact with a collection of unique Pokemons represented by ERC-20 tokens. Players can mint new tokens, transfer them, burn tokens, and redeem them to acquire Pokemons.

## Features

- Mint new tokens and assign them to a specified address (Only the contract owner can perform this action).
- Transfer tokens to another address.
- View all available Pokemons and their details.
- Redeem a Pokemon using tokens.
- Burn a specified amount of tokens.
- Check the token balance of the caller (player).

## Requirements

- Solidity ^0.8.18
- OpenZeppelin library (imported contracts)

## Installation

This project utilizes OpenZeppelin library for ERC-20 implementation. To get started, make sure to have the OpenZeppelin library installed.

1. Install OpenZeppelin:

```bash
npm install @openzeppelin/contracts
```

2. Deploy the smart contract to the desired Ethereum network.

## Usage

The DegenToken contract provides several functions to interact with the tokens and Pokemons.

### Constructor

- `constructor()`: Initializes the ERC-20 token with the name "Degen" and the symbol "DGN". During contract deployment, a set of preset Pokemons (Bulbasaur, Charmander, Squirtle, Pikachu, and Eevee) will be made available for redemption.

### Mint Tokens

- `function mintTokens(address to, uint256 amount) public onlyOwner`: Allows the contract owner to mint and assign new tokens to a specified address.

### Transfer Tokens

- `function transferTokens(address recipient, uint256 amount) external`: Allows players to transfer their tokens to another address.

### Show Available Pokemons

- `function showAvailablePokemons() external view returns (Pokemon[] memory)`: Allows players to view all available Pokemons and their details.

### Redeem Pokemon

- `function redeemPokemon(uint256 choice) external`: Allows players to redeem a Pokemon using tokens. Players must provide the choice of the desired Pokemon, and the corresponding token amount will be burned from their balance.

### Burn Tokens

- `function burnTokens(uint256 amount) external`: Allows players to burn (destroy) a specified amount of their tokens.

### Check Balance

- `function checkBalance() external view returns (uint256)`: Allows players to check the token balance of their address.

## License

This project is licensed under the MIT License. You can find the full text of the license in the file named `LICENSE`.

## Author

Eiron Maningat - Mapua University

## Contributing

If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request.

Please note that this README assumes a general familiarity with Solidity, ERC-20 tokens, and smart contract deployment on Ethereum networks. Additionally, this is a basic README template and can be further customized based on your specific project's needs.
