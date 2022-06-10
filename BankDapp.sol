// SPDX-License-Identifier: UNLICENSED
// deposit and withdraw funds
pragma solidity ^0.8.7;

contract BankDapp {
    // mapping of addresses
    mapping(address => uint256) public accounts;

    modifier hasFunds(uint256 _amount) {
        require(_amount <= accounts[msg.sender], "Does not own sufficient funds");
        _;
    }
    // recive ether into the bank / contract address
    function deposit() public payable {
        accounts[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public hasFunds(_amount) {
        payable(msg.sender).transfer(_amount); // calls modifier
    }

    function checkAssets() public view returns(uint256) {
        return address(this).balance;
    }

    function transferFunds(address _receiver, uint _amount) public {
        payable(msg.sender).transfer(_amount); // transfer funds to another account
    }
}
