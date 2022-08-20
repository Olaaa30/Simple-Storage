//SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;
//importing the simplestorage contract;
import "./SimpleStorage.sol";

contract StorageFactory{
    //create an array to store instances of the simplestorage contract
    SimpleStorage[] public simpleStorageArray;

    //this function creates instances of the simplestorage contract 
    function createSimpleStorageContract() public{
        //create an instance of the simple storagecontract
        SimpleStorage simpleStorage = new SimpleStorage();
        //push it to the simplestoragearray;
        simpleStorageArray.push(simpleStorage);
    }
    //@func sfStore(storagefactorystore) - this function grabs a SimpleStorage contract from
    //                                      the simpleStorageArray using its index and uses its 
    //                                      store function to store a number on the blockchain(testnet)
    //@param _simpleStorageIndex - index of the instance of the simpleStorage contract
    //                              we want to grab from the simpleStorageArray
    //@param _simpleStorageNumber - number to be stored
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        // grab the SimpleStorage contract using its index from the simpleStorageArray
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    //grab a simpleStorage contract using its index and call the retrieve function
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}