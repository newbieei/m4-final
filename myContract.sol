// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Structure to represent a unique Pokemon
    struct Pokemon {
        uint256 id;      // Unique identifier for the Pokemon
        string name;     // Name of the Pokemon
        uint256 level;   // Level of the Pokemon
    }

    Pokemon[] private pokemons; // Array to store the list of available Pokemon

    // Event emitted when a player redeems a Pokemon
    event PokemonRedeemed(Pokemon pokemon);

    // Constructor function to initialize the token with initial Pokemon
    constructor() ERC20("Degen", "DGN") {
        // Preset Pokemon to choose from during contract deployment
        pokemons.push(Pokemon(1, "Bulbasaur", 10));
        pokemons.push(Pokemon(2, "Charmander", 15));
        pokemons.push(Pokemon(3, "Squirtle", 12));
        pokemons.push(Pokemon(4, "Pikachu", 18));
        pokemons.push(Pokemon(5, "Eevee", 20));
    }

    // Function to allow the contract owner to mint new tokens and assign them to a specified address
    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to allow players to transfer their tokens to another address
    function transferTokens(address recipient, uint256 amount) external {
        _transfer(msg.sender, recipient, amount);
    }

    // Function to view all available Pokemon and their details
    function showAvailablePokemons() external view returns (Pokemon[] memory) {
        return pokemons;
    }

    // Function to redeem a Pokemon using tokens
    function redeemPokemon(uint256 choice) external {
        // Check if the choice is valid and within the available Pokemon range
        require(choice >= 1 && choice <= pokemons.length, "Invalid Choice");

        // Get the level of the chosen Pokemon
        uint256 pokemonLevel = pokemons[choice - 1].level;

        // Burn the required tokens from the sender's balance
        _burn(msg.sender, pokemonLevel);

        // Emit an event to notify that a Pokemon has been redeemed
        emit PokemonRedeemed(pokemons[choice - 1]);
    }

    // Function to allow players to burn (destroy) a specified amount of their tokens
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Function to check the token balance of the caller (player)
    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
