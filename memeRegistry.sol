//Code for dacade dApp development 101 Events and finishing touches for the UI
pragma solidity ^0.4.24;

contract memeRegistry {
    
    struct memecert {
        string name;
        uint timestamp;
    }
    
    mapping (string => memecert) memecerts;
    
    event memecertInfo(      
 	string name,
       uint timestamp,
       string url
    );
    
    function setMemecert(string _url, string _name) public {
        require (bytes(_url).length != 0);
        require (bytes(_name).length != 0);
 
        require(memecerts[_url].timestamp == 0);
        
        memecerts[_url] = memecert(_name, now);
        emit memecertInfo(_name, now, _url);
    }
    
    function getMemecert(string _url) view public returns (string, uint) {
        return (memecerts[_url].name, memecerts[_url].timestamp);
    }
}
