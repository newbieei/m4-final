// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    // Struct to represent a market item
    struct MarketItem {
        uint256 itemId;
        string name;
        uint256 price;
    }

    // Mapping to store the market items by their ID
    mapping(uint256 => MarketItem) public marketItems;

    // Array to store the list of item IDs
    uint256[] public itemIds;

    // Mapping to store the items owned by each address and its quantity
    mapping(address => mapping(uint256 => uint256)) public myItems;

    constructor() ERC20("Degen", "DGN") {
        // Add preset items to the market during contract deployment
        addItemToMarket("Shirt", 100);
        addItemToMarket("Shoes", 150);
        addItemToMarket("Bag", 80);
    }

    // Override decimals to set it to 0 (since tokens are non-fungible)
    function decimals() public pure override returns (uint8) {
        return 0;
    }

    // Allows the contract owner to create new tokens and assign them to a specified address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Internal function to add an item to the market (only callable by the contract owner)
    function addItemToMarket(string memory itemName, uint256 itemPrice) internal onlyOwner {
        // Calculate the new item ID based on the current array length
        uint256 itemId = itemIds.length + 1;
        // Create a new MarketItem instance and store it in the mapping
        marketItems[itemId] = MarketItem(itemId, itemName, itemPrice);
        // Add the new item ID to the array of item IDs
        itemIds.push(itemId);
    }

    // Function to view all market items and their details
    function viewMarketItems() public view returns (string[] memory) {
        // Create a dynamic array to store item details
        string[] memory itemDetails = new string[](itemIds.length);

        // Loop through all item IDs and retrieve their details
        for (uint256 i = 0; i < itemIds.length; i++) {
            uint256 itemId = itemIds[i];
            MarketItem memory item = marketItems[itemId];
            // Concatenate the item name and price and store it in the array
            itemDetails[i] = string(abi.encodePacked(item.name, " - Price: ", uintToStr(item.price)));
        }

        return itemDetails;
    }

    // Function to buy a market item using tokens
    function buyMarketItem(uint256 itemId) public {
        MarketItem memory item = marketItems[itemId];
        require(item.itemId > 0, "Invalid item ID");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");

        // Transfer tokens from the buyer to the contract owner
        _transfer(msg.sender, owner(), item.price);
        // Increment the quantity of the item owned by the user
        myItems[msg.sender][itemId]++;
    }

    // Function to view the items and their quantities owned by a user
    function getMyItems() public view returns (string[] memory, uint256[] memory) {
        // Create dynamic arrays to store item names and quantities
        string[] memory itemNames = new string[](itemIds.length);
        uint256[] memory quantities = new uint256[](itemIds.length);

        // Loop through all item IDs and retrieve the user's quantities
        for (uint256 i = 0; i < itemIds.length; i++) {
            uint256 itemId = itemIds[i];
            MarketItem memory item = marketItems[itemId];
            itemNames[i] = item.name;
            quantities[i] = myItems[msg.sender][itemId];
        }

        return (itemNames, quantities);
    }

    // Helper function to convert uint256 to string
    function uintToStr(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);

        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }

        return string(buffer);
    }
}
