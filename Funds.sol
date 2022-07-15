import "@openzeppelin/contracts/access/Ownable.sol";

contract Funds is Ownable {
    event FundsReleased(uint256, address);
    
    address public recipient;
    bool public isReleased;

    constructor(address _recipient){
        totalFunds = msg.value;
        recipient = _recipient;
        isReleased = false;
    }

    //Release Funds to the Recipient after proposal is passed
    function releaseFunds(uint256 amount) public onlyOwner {
        isReleased = true;
        payable(recipient).transfer(amount);
    }
}
