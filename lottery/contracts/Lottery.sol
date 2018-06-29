pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    function Lottery() public{
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);

        players.push(msg.sender);
    }

    function random() private view returns (uint){
       return uint(sha3(block.difficulty, now, players));
    }

    function pickWinner() public restricted{

        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0); //new dynamic array of size 0
    }

    modifier restricted(){ // Modifier allows for code reusability (see above)
        require(msg.sender == manager);
        _; //don't forget this bit
    }

    function getPlayers() public view returns(address[]){
        return players;
    }
}

/*

contract Inbox {
    string public message;

    constructor (string initialMessage) public {
        message = initialMessage;
    }

    function setMessage(string newMessage) public {
        message = newMessage;
    }

}

*/
