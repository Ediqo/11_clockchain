contract Clockchain {
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => bool) public initialOffers;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function Clockchain() {
        balanceOf[msg.sender] = 5000;              // Give the creator all initial tokens
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
    }

    function initUser(address addr) {
        require(initialOffers[addr] == false);
        initialOffers[addr] = true;
        balanceOf[addr] = 2;
    }
}