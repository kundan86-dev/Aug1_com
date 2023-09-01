// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract mangager{

    address public sponsor;
    address public student;
    bool public isRegistered;
    mapping(address => string) public userInfo;
    mapping(address => string) public userType;

    constructor(address _sponsor, address _student) {
        sponsor = _sponsor;
        student = _student;
        isRegistered = false;
        
        userType[_sponsor] = "Sponsor";
        userType[_student] = "Student";
    }

    function registerUser(string memory info) public {
        require(msg.sender == sponsor, "Only the sponsor can register the student.");
        require(!isRegistered, "Student is already registered.");
        
        isRegistered = true;
        userInfo[student] = info;
    }

    function isUserRegistered() public view returns (bool) {
        return isRegistered;
    }

    function getUserInfo(address userAddress) public view returns (string memory, string memory) {
        string memory typeOfUser = userType[userAddress];
        string memory info = userInfo[userAddress];
        return (typeOfUser, info);
    }
}






