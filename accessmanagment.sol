//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Access {



    event GrantRole (bytes32 indexed role, address indexed account);
    event RevokeRole (bytes32 indexed role, address indexed account);

    mapping (bytes32 => mapping(address => bool)) public roles;

    modifier onlyRole (bytes32 _role){
                       require(roles[role][msg.sender], "it is not authorized role");
                       ;
    }
    constructor() {
        //Person which deploys contract is Admin
    _grantRole (Admin, msg.sender);
    }
    // Used for definig roles 
    bytes32 private constant Admin = keccak256(abi.encodePacked("Admin"));
    bytes32 private constant User = keccak256(abi.encodePacked("User"));
    }
    //Function defines the role inside of SC internaly
    function _grantRole (bytes32 _role, address _account) internal {
                        roles[_role][_address] = true;
                        emit GrantRole(_role, _account);
    }
    //Function defines the role inside of SC externaly and can be only called if msg.sender has Admin role granted
    function _grantRole (bytes32 _role, address _account) external onlyRole(Admin) {
                         _grantRole(_role, _account);

    }
    //Only Admin can revoke contract and role
    function revokeRole (bytes32 _role, address _account) external onlyRole(Admin) {
                        roles[_role][_address] = false;
                        emit RevokeRole(_role, _account);

}
}
