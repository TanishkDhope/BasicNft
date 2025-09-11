//SPDX-Licens-Identifier:MIT
pragma solidity ^0.8.30;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract MoodNftTest is Test {
    MoodNft private moodNft;
    DeployMoodNft private deployer;
    address Bob = makeAddr("Bob");

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testDefaultHappy() public {
        //Arrange
        vm.prank(Bob);
        //Act
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
        //Assert
    }
}
