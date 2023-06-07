pragma solidity >0.7.0 <=0.9.0;

contract Crowdfunding {
    
    address[] donatur;
    address manager;

    constructor (address _manager) {
        _manager = msg.sender;
        manager = _manager;
    }

    modifier managerOnly {
        require(msg.sender == manager, "Hanya bisa dilakukan oleh manager");
        _;
    }

    function inputUangDonasi() public payable {
        donatur.push(msg.sender);
    }

    function tampilkanDonatur() public managerOnly() view returns(address[] memory) { 
        return donatur;
    }

    function kirimUang(address payable penerimaDonasi) public managerOnly() {
        penerimaDonasi.transfer(address(this).balance);
    }
}
