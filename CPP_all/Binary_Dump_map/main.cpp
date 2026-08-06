#include <iostream>

using namespace std;

void binary_Dump()
{
    unsigned int temp = 0;
    while(temp <= 8)
    {
        cout << "Number: " << temp
            << "\tBinary notation: ";
        for(int bit = 7; bit >= 0; --bit)
        {
            cout << ((temp >> bit) & 1);
        }
        cout << "\n";
        temp++;
    }
}

int main(int argc, char** argv)
{
    binary_Dump();

    cout << EXIT_SUCCESS;
    return 0;
}
