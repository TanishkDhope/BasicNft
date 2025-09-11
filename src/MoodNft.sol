//SPDX-License-Identifier:MIT

pragma solidity ^0.8.30;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    error Mood__NotOwner();

    uint256 private s_token_counter;
    string private s_sadSvg;
    string private s_happySvg;

    enum Mood {
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("Mood Nft", "MN") {
        s_token_counter = 0;
        s_sadSvg = sadSvgImageUri;
        s_happySvg = happySvgImageUri;
    }
    //function to mint

    function mintNft() public {
        _safeMint(msg.sender, s_token_counter);
        s_tokenIdToMood[s_token_counter] = Mood.HAPPY;
        s_token_counter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    //return tokenUri
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageURI = s_happySvg;
        } else {
            imageURI = s_sadSvg;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( // bytes casting actually unnecessary as 'abi.encodePacked()' returns a bytes
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
    //function to flip Mood

    function flipMood(uint256 tokenId) public {
        if (ownerOf(tokenId) != msg.sender) {
            revert Mood__NotOwner();
        }
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            s_tokenIdToMood[tokenId] == Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] == Mood.HAPPY;
        }
    }
}
