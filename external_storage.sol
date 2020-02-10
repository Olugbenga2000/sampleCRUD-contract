pragma solidity ^0.5.0;
contract onlineStore{
    struct item{
        string name;
        uint16 price;
        uint8 rating;
        string category;
    }
    uint itemId =0;
    mapping(uint => item) ID;
    address public owner;
   
}
