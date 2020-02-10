pragma solidity ^0.5.0;
import './external storage.sol';
contract Callingcontract is onlineStore{
constructor()public {
    owner = msg.sender;
    }
modifier onlyowner(){
    require(msg.sender==owner,'only the owner can call d function');
    _;
}
function changeOwner(address _newOwner) external onlyowner{
    owner = _newOwner;
}
 function addItem(string calldata _name,uint16  _price, uint8  _rating,string calldata _category) external onlyowner{
    item memory newItem = item(_name,_price,_rating,_category);
     ID[itemId]=newItem;
      itemId++ ;
 }

 function getItem(uint _itemId) external view returns(string memory,uint16,uint8,string memory){
     item memory Item = ID[_itemId];
     return (Item.name,Item.price,Item.rating,Item.category);
     
 }
 function updateItem(uint  _itemId,string calldata  _name,uint16  _price, uint8  _rating, string calldata _category) external onlyowner {
     item memory currentItem = ID[_itemId];
     currentItem = item(_name,_price,_rating,_category);
     ID[_itemId] = currentItem;
 }
 function deleteItem( uint _itemId) external onlyowner{
     delete ID[_itemId];
 }
}