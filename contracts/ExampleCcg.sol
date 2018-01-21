pragma solidity ^0.4.18;
import "./Ccg.sol";

contract ExampleCcg is Ccg {
    string[] public Rarity = ["common", "rare", "epic", "legendary"];
    uint[5] public packDisplay;

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
        5,6,7 = Rare
        0,1,2,3,4 = Common
        */
        uint[5] memory pack = Ccg._generateRandomNumberSet(10, 5);
        return pack;
    }
}