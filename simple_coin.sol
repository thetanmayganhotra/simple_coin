pragma solidity >=0.7.0 <0.9.0;

contract coin1{
    address public minter;
    
    mapping(address => uint) public balances;
    
    event send(address from,address to,uint amount);
    constructor(){
        minter = msg.sender;
    }
    
    function mint(address receiver,uint amount) public {
        require(msg.sender == minter, "must be minter");
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    
    function sending(address receiver1,uint amount1) public {
        require(amount1 <= balances[msg.sender], "insufficient balance");
        balances[receiver1] += amount1;
        balances[msg.sender] -= amount1;
        emit send(msg.sender,receiver1,amount1);
    }
    
    
    
}