// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFT1155 is ERC1155, Ownable {
    
  string public projprojprojName;
  string public projSymbol;

  mapping(uint => string) public tokenURI;

  constructor() ERC1155("") {
    projprojprojName = "insert projprojName";
    projSymbol = "insert projSymbol";
  }

  function projMint(address _to, uint _id, uint _amount) external onlyOwner {
    _projMint(_to, _id, _amount, "");
  }

  function projMintBatch(address _to, uint[] memory _ids, uint[] memory _amounts) external onlyOwner {
    _projMintBatch(_to, _ids, _amounts, "");
  }

  function projBurn(uint _id, uint _amount) external {
    _projBurn(msg.sender, _id, _amount);
  }

  function projBurnBatch(uint[] memory _ids, uint[] memory _amounts) external {
    _projBurnBatch(msg.sender, _ids, _amounts);
  }

  function setURI(uint _id, string memory _uri) external onlyOwner {
    tokenURI[_id] = _uri;
    emit URI(_uri, _id);
  }

  function projBurnForprojMint(address _from, uint[] memory _projBurnIds, uint[] memory _projBurnAmounts, uint[] memory _projMintIds, uint[] memory _projMintAmounts) external onlyOwner {
    _projBurnBatch(_from, _projBurnIds, _projBurnAmounts);
    _projMintBatch(_from, _projMintIds, _projMintAmounts, "");
  }

  function uri(uint _id) public override view returns (string memory) {
    return tokenURI[_id];
  }

}
   
