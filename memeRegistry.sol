//Code for dacade dApp development 101 Events and finishing touches for the UI
pragma solidity ^0.4.21;

contract memeRegistry {

    struct memecert {
        address creator;
        string name;
        uint timestamp;
    }

    mapping (string => memecert) memecerts;

    event memecertInfo(
       address creator,
       string name,
       uint timestamp,
       string url
    );

    function setMemecert(string _url, address _creator, string _name) public {
        require (bytes(_url).length != 0);
        require (_creator != 0x0);
        require (bytes(_name).length != 0);

        require(memecerts[_url].creator == 0x0);

        memecerts[_url] = memecert(_creator, _name, now);
        emit memecertInfo(_creator, _name, now, _url);
    }

    function getMemecert(string _url) view public returns (address, string, uint) {
        return (memecerts[_url].creator, memecerts[_url].name, memecerts[_url].timestamp);
    }
}
