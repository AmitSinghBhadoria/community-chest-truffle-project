pragma solidity >=0.4.21 <0.6.0;
import "./usingProvable.sol";

contract CommunityChest is usingProvable{
    uint public identity;
    bytes32 public myid;
    event LogNewProvableQuery(string description);
    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }

    function () external payable {
        // nothing else to do!
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
   function __callback(bytes32 _myid,string memory result) public {
    //    if (msg.sender != provable_cbAddress()) revert("unnown user");
       identity = parseInt(result);
       myid = _myid;
       if(parseInt(result) == 1) withdraw();
   }
    
    function update() public payable {
        emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");
        provable_query("http://localhost:3000/api/user/validateUser?address=0x7EC80025515C6a7B74bB36D4FCd122f6D144e658", "json(http://localhost:3000/api/user/validateUser?address=0x7EC80025515C6a7B74bB36D4FCd122f6D144e658).data.validate");
    }
}
