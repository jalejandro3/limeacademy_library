// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma abicoder v2;

import "./Ownable.sol";

contract Library is Ownable {
    mapping(string => uint) public libraryBooks;

    struct Book {
        string title;
        uint qty;
    }

    struct User {
        address _address;
    }

    event LogLibraryBooks(Book[] books);
    event LogAddedLibraryBook(string title, uint qty);
    event LogUserList(User userList);

    function addBook(Book calldata book) public onlyOwner {
        require(book.qty > 0, "You must add at least one copy.");
        libraryBooks[book.title] += book.qty;
        emit LogAddedLibraryBook(book.title, book.qty);
    }
}