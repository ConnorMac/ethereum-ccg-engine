pragma solidity ^0.4.18;
import "./Ownable.sol";

contract CardCollection is Ownable {
    /* This contract defines the set of cards in the game */
    string public collection_name;
    uint public version;

    function CardCollection(string _name, uint _version) public {
        collection_name = _name;
        version = _version;
    }
    function addCard(uint _index) public onlyOwner();
    function editCard(uint _index) public onlyOwner();
}

contract ExampleCardCollection is CardCollection {
    /* 
    This struct should be interchangable. TODO: Work out how to set dynamically in constructor
    */
    struct Card {
        string name;
        string text;
        int8 attack;
        int8 defence;
        int8 rarity;
        uint lastModified;
        uint created;
    }
    mapping(uint => Card) Cards;

    function addCard(uint _index, string _name, string _text, int8 _rarity, int8 _attack, int8 _defence) public 
        onlyOwner() 
    {
        Cards[_index].name = _name;
        Cards[_index].text = _text;
        Cards[_index].attack = _attack;
        Cards[_index].defence = _defence;
        Cards[_index].rarity = _rarity;
        Cards[_index].created = block.timestamp;
    }

    function editCard(uint _index, string _name, string _text, int8 _rarity, int8 _attack, int8 _defence) public 
        onlyOwner() 
    {
        // TODO: Build this more dynamically
        Cards[_index].name = _name;
        Cards[_index].text = _text;
        Cards[_index].attack = _attack;
        Cards[_index].defence = _defence;
        Cards[_index].rarity = _rarity;
        Cards[_index].lastModified = block.timestamp;
    }
}