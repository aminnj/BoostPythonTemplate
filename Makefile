PYTHON_VERSION = 2.7
PYTHON_INCLUDE = /cvmfs/cms.cern.ch/$(SCRAM_ARCH)/external/python/2.7.11-mlhled2/include/python2.7
PYTHON_CONFIG = /cvmfs/cms.cern.ch/$(SCRAM_ARCH)/external/python/2.7.11-mlhled2/lib/python2.7/config
BOOST_INC = /cvmfs/cms.cern.ch/$(SCRAM_ARCH)/external/boost/1.63.0-mlhled2/include
BOOST_LIB = /cvmfs/cms.cern.ch/$(SCRAM_ARCH)/external/boost/1.63.0-mlhled2/lib
LINUXADD=-Wl,--export-dynamic
ROOTSTUFF=`root-config --cflags --libs --glibs` -g
CFLAGS=

MODULES := $(wildcard *.cpp)
MODULES_OBJ_FILES := $(addprefix ./,$(notdir $(MODULES:.cpp=.o)))
MODULES_SHARED_LIBS := $(addprefix ./,$(notdir $(MODULES:.cpp=.so)))

all: $(MODULES_SHARED_LIBS) $(MODULES_OBJ_FILES)

%.o: %.cpp 
	g++   $(ROOTSTUFF) -O2 -I./interface -I$(PYTHON_INCLUDE) -I$(BOOST_INC) -fPIC -c -o $(@) $<

%.so: %.o
	g++ -shared $(LINUXADD)  $(ROOTSTUFF) -L./  -L$(BOOST_LIB)  -lboost_python -L$(PYTHON_CONFIG) -lpython2.7  $< -o $(@) 
   
clean: 
	rm -f $(MODULES_SHARED_LIBS) $(MODULES_OBJ_FILES)
