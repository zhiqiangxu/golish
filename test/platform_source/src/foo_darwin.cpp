#include "foo.h"
#include <iostream>

void
Foo::platformSpecific()
{
    std::cout << "platformSpecific" << std::endl;    
}