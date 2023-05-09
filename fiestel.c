/**
 * Feistel cipher implementation according to COMP1212: Coursework 2 specifications
*/

#include <stdio.h>
#define INT_BITS 8
short encrypt(short text, unsigned char key);


int main(int argc, char const *argv[])
{
    short text = 345;
    unsigned char key = 2;

    printf("Text: %d\n", text);
    printf("Key: %d\n", key);
    printf("Encrypted: %d\n", encrypt(text, key));

    return 0;
}

short encrypt(short text, unsigned char k){
    short l = (text & -256) >> 8;
    short r = text & 255;
    char left =  l;
    char right = r;
    unsigned char key = k;
    for (int i = 0; i < 4; i++)
    {
        char temp = right;
        right = left ^ (right ^ ~key);
        left = temp;
        key = ((key << 1) | (key >> (7)));
    }
    l = left & 255;
    r = right & 255;
    short result = (l << 8) | r;
    return result;
}
