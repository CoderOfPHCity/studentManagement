// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract School {
    struct Student {
        string name;
        uint256 matNumber;
        uint256 scores;
    }

    constructor() {
        principal = msg.sender;
    }

    address public principal;
    mapping(address => bool) public teachers;
    Student[] public student;

    modifier onlyPrincipal() {
        require(
            msg.sender == principal,
            "Commot body,Only oga at the top fit run this function!"
        );
        _;
    }

    function addTeacher(address _teacher) public onlyPrincipal {
        teachers[_teacher] = true;
    }

    function updatestudent(
        string memory _name,
        uint256 _matNumber,
        uint256 _scores
    ) public onlyPrincipal {
        Student memory updateStd = Student({
            name: _name,
            matNumber: _matNumber,
            scores: _scores
        });

        student.push(updateStd);
    }

    function updateScore(uint256 id, uint256 _score) public {
        require(
            teachers[msg.sender] || principal == msg.sender,
            "wida you!, no trespassing is allowed"
        );
        Student storage studentscore = student[id];
        studentscore.scores = _score;
    }

    function getScoreSheet() public view returns (Student[] memory) {
        return student;
    }
}