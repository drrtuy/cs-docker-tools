#include <iostream>

using namespace std;

// usage: em_generator records_number width OID initial_block_number

int main(int argc, char**argv)
{
    uint64_t numberOfRecs;
    uint64_t blockNumber;// = 2689076224;
    uint64_t OID; // = 201144;
    uint64_t width; // = 8;
    cin >> numberOfRecs;
    cin >> width;
    cin >> OID;
    cin >> blockNumber;
    constexpr const size_t blockSize = 8192ULL;
    constexpr const uint64_t unitSize = 1024;
    for (size_t i = 0; i < numberOfRecs; ++i)
    {
        cout << blockNumber << "|" << width << "|" << OID << "|0|0|0|0|1|" << width << "|0|-9223372036854775808|9223372036854775807|0|2|" << std::endl;
        blockNumber += width * unitSize;
    }

}
