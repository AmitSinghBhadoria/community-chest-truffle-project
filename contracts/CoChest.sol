pragma solidity >=0.4.21 <0.6.0;
import "github.com/provable-things/ethereum-api/blob/master/provableAPI_0.5.sol";

contract CommunityChest is usingProvable{
    uint public identity;
    event LogNewProvableQuery(string description);
    event queryResult(string resultdescription);
    
    function withdraw(address payable senderAddress) public payable{
        senderAddress.transfer(address(this).balance);
    }

    function () external payable {
        // nothing else to do!
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
   function __callback(string memory result) public {
       if (msg.sender != provable_cbAddress()) revert();
       emit queryResult(result);
    //   identity = parseInt(result);
    //   if(parseInt(result) == 1) withdraw(msg.sender);
   }
    
    function update() public payable {
        emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");
        provable_query("URL", "json(https://www.therocktrading.com/api/ticker/BTCEUR).result");
    }
}
