// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Transactions {
    uint256 transactionCount; // uint 256 biểu diễn giá trị không âm.
    // event được sử dụng để tạo bản ghi không thay đổi trong lịch sử giao dịch.
    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    struct TransferStruct {
        address sender; // người gửi.
        address receiver; // người nhận
        uint amount; // lượng tiền
        string message; // mes
        uint256 timestamp;// mốc thời gian.
        string keyword; // keywword của transaction.         
    }

    TransferStruct[] transactions; // ds các giao dịch.
    // biến receiver cho phép nhận và chuyển tiền Ether.
    // msg biến toàn cục cung cấp thông tin giao dịch.
    // msg.sender: Người gửi, msg.value: wei được gửi( min ở ether)
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        transactionCount += 1; // biến lưu số lượng giao dịch
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword)); // giao dịch được thêm vào ds.
        
        // Giao dịch được thực hiện. 
        // emit để kích hoạt sự kiện.
        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    // Hàm trả về ds các giao dịch.
    // view: không thay đổi dữ liệu của hợp đồng, không tốn gas khi gọi.
    function getAllTransactions() public view returns(TransferStruct[] memory) {
        return transactions; // mảng TransferStruct[] transactions;
    }

    function getTransactionCount() public view returns(uint256) {
        return transactions.length;
    }

}
