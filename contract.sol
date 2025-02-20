
pragma solidity ^0.8.0;

contract PerformanceTracker {
    struct Performance {
        uint256 score;
        string description;
        uint256 timestamp;
    }
    
    mapping(address => Performance[]) private userPerformances;
    
    event PerformanceRecorded(address indexed user, uint256 score, string description, uint256 timestamp);
    
    function recordPerformance(uint256 _score, string memory _description) public {
        Performance memory newPerformance = Performance({
            score: _score,
            description: _description,
            timestamp: block.timestamp
        });
        
        userPerformances[msg.sender].push(newPerformance);
        
        emit PerformanceRecorded(msg.sender, _score, _description, block.timestamp);
    }
    
    function getPerformanceHistory(address _user) public view returns (Performance[] memory) {
        return userPerformances[_user];
    }
}
