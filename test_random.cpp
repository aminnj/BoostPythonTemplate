#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <numeric>
#include <exception>

#include <boost/python.hpp>
#include "boost/python/extract.hpp"
#include "boost/python/numeric.hpp"

#include "TRandom3.h"

using namespace boost::python;

float get_random(boost::python::numeric::array dummy_arr, int dummy_int){

    TRandom3 * rnd = new TRandom3();
    return rnd->Uniform(0,dummy_int);

}

BOOST_PYTHON_MODULE(test_random) {
    boost::python::numeric::array::set_module_and_type("numpy", "ndarray");
    def("get_random", &get_random);
}

