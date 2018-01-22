pragma solidity ^0.4.18;
import "./Ccg.sol";

contract ExampleCcg is Ccg {
    string[] public Rarity = ["common", "rare", "epic", "legendary"];
    uint[5] public packDisplay;
    uint public packSize = 5;

    function purchasePack() public payable {
        uint[5] memory pack = ExampleCcg._generatePack();
        packDisplay = pack;
        // return pack;
    }

    function _generatePack() internal returns(uint[5]) {
        /*
        Function returns an array of cards opened by the user

        Uses a 0-9 Pseudo random number generator to calc rarity:
        9 - Legendary
        7,8 = Epic
        4,5,6 = Rare
        0,1,2,3 = Common
        */
        uint[5] memory rarityIterations;
        bytes32 blockHash = block.blockhash(block.number-1);
        for (uint index = 0; index < packSize; index++) {
            uint randomNum = uint(blockHash) % 10;
            blockHash = keccak256(blockHash);
            uint legendCount = 0;
            uint epicCount = 0;
            uint rareCount = 0;
            // uint memory common_count = 0;
            for (uint x = 0; x < rarityIterations.length; x++) {
                if (rarityIterations[x] == 9) {
                    if (legendCount >= 1) {index--;}
                    legendCount++;
                }
                if (rarityIterations[x] == 7 || rarityIterations[x] == 8) {epicCount++;}
                if (rarityIterations[x] == 5 || rarityIterations[x] == 6 || rarityIterations[x] == 4) {rareCount++;}
            }
            rarityIterations[index] = randomNum;
        }
        return rarityIterations;
    }
}