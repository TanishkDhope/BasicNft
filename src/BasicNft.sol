//SPDX-License-Identifier:MIT

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

pragma solidity ^0.8.30;

contract BasicNft is ERC721{
    uint256 private s_tokenCounter;
    mapping(uint256=>string) private tokenIdToUri;

    constructor()ERC721("Dogie","DOG"){
        s_tokenCounter=0;
    }

    function mintNft(string memory tokenUri) public{
        tokenIdToUri[s_tokenCounter]=tokenUri;
        _safeMint(msg.sender,s_tokenCounter);
        s_tokenCounter++;

    }

    function tokenURI(uint256 tokenId)public view override returns(string memory){
        return tokenIdToUri[tokenId];
    }
   
}

