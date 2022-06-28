//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract A{
    int public x = 10;
    int y = 20; //internal by default

    function get_y() public view returns(int){
        return y;
    }

    function f1() private view returns(int){
        return x;
    }

    function f2() public view returns(int){
        int a;
        a = f1();
        return a;
    }

    function f3() internal view returns(int){
        return x;
    }

    function f4() external view returns(int){
        return x;
    }

    function f5() public pure returns(int){
        int b;
        // b = f4(); //f4() is external
        // f4() wouldn't be possible to be called
        return b;
    }
}

contract B is A{
    int public xx = f3();
    //int public yy = f1(); -> f1() is private and connot be called from derived contracts
}

contract C{
    A public contract_a = new A();
    int public xx = contract_a.f4();
    
}