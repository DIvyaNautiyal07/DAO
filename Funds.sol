import "@openzeppelin/contracts/access/Ownable.sol";

contract Funds is Ownable {
    event FundsReleased(uint256, address);

    uint256 public totalFunds;
    address public recipient;
    bool public isReleased;

    constructor(address _recipient) payable {
        totalFunds = msg.value;
        recipient = _recipient;
        isReleased = false;
    }

    //Release Funds to the Recipient after proposal is passed
    function releaseFunds() public onlyOwner {
        isReleased = true;
        payable(recipient).transfer(totalFunds);
    }
}
