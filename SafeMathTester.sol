// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//This contract explores the limitations of solidity before the 
//version 0.8 was released
contract SafeMathTester{
    //max value can be stored by a uint8 is 255
    //so what would happen when I add one to it's value?
    uint8 public bigNumber = 255;

    function add() public {
        //add one to the value of bigNumber
        //this makes the value of bigNumber = 256
        bigNumber = bigNumber + 1;
        //for later versions, 
        unchecked {
            bigNumber = bigNumber + 1;
        }
        //the highest possible value of bigNumber has been reached so 
        //so solidity wraps the value back to zero
    }
}