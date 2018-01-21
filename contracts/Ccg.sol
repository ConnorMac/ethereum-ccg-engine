pragma solidity ^0.4.18;
import "./Ownable.sol";
import "./CardCollection.sol";

contract Ccg is Ownable {
    // Ccg variables
    string public name;
    string public version;

    // Card variables
    CardCollection public cardCollection;
    struct OwnedCardDetails {
        uint index; // CardCollection index
        uint8 numberOwned;
    }

    mapping(address => OwnedCardDetails[]) OwnedCards;

    function _generateRandomNumber(uint mod) internal returns(uint) {
        /*
        Rudementary random number generator
        */
        return uint(block.blockhash(block.number-1)) % mod;
    }

    function _generateRandomNumberSet(uint mod, uint iterations) internal returns(uint[5]) {
        /*
        Number generator that creates a set of random numbers.
        */
        uint[5] memory rarityIterations;
        bytes32 blockHash = block.blockhash(block.number-1);
        for (uint index = 0; index < iterations; index++) {
            rarityIterations[index] = uint(blockHash) % mod;
            blockHash = keccak256(blockHash);
        }
        return rarityIterations;
    }
}
