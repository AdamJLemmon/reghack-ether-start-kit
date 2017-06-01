pragma solidity ^0.4.6;

// Template contract with a few examples for the purpose
// of the RegHackDownUnder hackathon in Melbourne, Ausralia

// import './<Contract>.sol'

/// @title Template Contract - RegHackDownUnder hackathon 2017
/// @author Adam Lemmon - <adamjlemmon@gmail.com>
contract RegHackTemplate {
    /*
    * Constants
    */

    /*
    * Storage
    */
    address owner;
    mapping(string=>)
    string[] hackers;

    struct Hacker {
        string name;
        uint timestamp;
    }

    /*
    * Modifiers
    */

    /*
    * Events
    */
    event Hello(string hackerName);

    // @dev Contract constructor defines the owner account
    function RegHackTemplate(){
    	owner = msg.sender;
    }

    /*
    * Write Functions
    */
    /// @notice say hello with your name!
    /// @dev says hello to a new hacker!
    /// @param hacker :the hacker's name
    /// @return hackerName :the hacker's name
    function createHacker(string hacker) 
        constant
        external
    {
        Hello(hackerName);
    }

    /*
    * Read Functions
    */
    /// @notice say hello with your name!
    /// @dev says hello to a new hacker!
    /// @param hacker :the hacker's name
    /// @return hackerName :the hacker's name
    function getHacker(string hacker) 
    	constant
        external
     returns(string hackerName) {
        Hello(hackerName);
     }
}