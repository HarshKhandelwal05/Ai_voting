// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingAdvisor {

    // Enum to represent voting options
    enum Option { Option1, Option2, Option3, Option4 }
    
    // Mapping to store votes count for each option
    mapping(Option => uint256) public votes;
    
    // Mapping to track if an address has voted
    mapping(address => bool) public hasVoted;

    // Event to be emitted when a vote is cast
    event Voted(address indexed voter, Option option);

    // Function to vote for an option
    function vote(Option option) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        
        // Mark the sender as having voted
        hasVoted[msg.sender] = true;
        
        // Increase the vote count for the selected option
        votes[option] += 1;
        
        // Emit the voting event
        emit Voted(msg.sender, option);
    }

    // Function to view the current vote count for each option
    function getVotes(Option option) public view returns (uint256) {
        return votes[option];
    }

    // Function to check if the sender has voted
    function hasUserVoted() public view returns (bool) {
        return hasVoted[msg.sender];
    }
}
