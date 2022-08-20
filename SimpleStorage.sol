//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract SimpleStorage {
    //variable to store our favorite number
    uint256 favoriteNumber;

    //instantiate our people struct
    People public person = People({favoriteNumber: 8, name: "Olayinka"});

    //create a mapping(kinda like a dictionary) which maps a name to a favorite number
    mapping(string => uint256) public nameToFavoriteNumber;

    //create a struct for people
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    //create an array of people
    People[] public people;

    //function which retrieves our favorite number
   function retrieve() public view returns(uint256){
       return favoriteNumber;
   }
   //this function takes in a number and stores it in out favoriteNumber variable
   //also returns the number
   //@params _favoriteNmber - number to be stored
   function store(uint256 _favoriteNumber) public virtual{
       favoriteNumber = _favoriteNumber;
       retrieve();
   }

   //this function creates a person object
   //@params _name - the name of the person
   //@params _favoriteNumber - person's favoriteNumber
   function addPerson(string memory _name, uint256 _favoriteNumber) public{
        People memory newPerson = People(_favoriteNumber, _name);
        people.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
   }
}