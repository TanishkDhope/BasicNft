//SPDX-License-Identifier:MIT
pragma solidity ^0.8.30;
import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBsicNft.s.sol";
contract BasicNftTest{
    BasicNft public basicNft;
    DeployBasicNft public deployer;

    function setUp()public{
        deployer=new DeployBasicNft();
        basicNft=deployer.run();    
    }

    function testNameIsCorrect()public view{
        string memory actualName="Dogie";
        string memory name=basicNft.name();
        assert(keccak256(abi.encodePacked(name))==keccak256(abi.encodePacked(actualName)));

    }
}